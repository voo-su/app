import 'dart:developer';
import 'dart:io';
import 'package:ffmpeg_helper/ffmpeg_helper.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/domain/entities/common.dart';
import 'package:voo_su/domain/entities/contact.dart';
import 'package:voo_su/domain/entities/message.dart';
import 'package:voo_su/domain/usecases/chat/delete_messages_usecase.dart';
import 'package:voo_su/domain/usecases/chat/get_history_usecase.dart';
import 'package:voo_su/domain/usecases/chat/send_media_usecase.dart';
import 'package:voo_su/domain/usecases/chat/send_messages_usecase.dart';

part 'message_event.dart';

part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final GetHistoryUseCase _getHistoryUseCase;
  final SendMessagesUseCase _sendMessagesUseCase;
  final DeleteMessagesUseCase _deleteMessagesUseCase;
  final SendMediaUseCase _sendMediaUseCase;

  MessageBloc(
    this._getHistoryUseCase,
    this._sendMessagesUseCase,
    this._deleteMessagesUseCase,
    this._sendMediaUseCase,
  ) : super(InitialState()) {
    on<LoadHistoryEvent>(_onLoadHistory);
    on<SendMessagesEvent>(_onSendMessages);
    on<NewMessageEvent>(_onNewMessage);
    on<DeleteMessagesEvent>(_onDeleteMessages);
    on<SendMediaEvent>(_onSendMedia);
  }

  void _onLoadHistory(
    LoadHistoryEvent event,
    Emitter<MessageState> emit,
  ) async {
    try {
      emit(LoadingState());
      final result = await _getHistoryUseCase(event.params);
      result.fold(
        (failure) => emit(ErrorState(failure: failure)),
        (success) => emit(SuccessState(messages: success.messages)),
      );
    } catch (e) {
      emit(ErrorState(failure: ExceptionFailure()));
    }
  }

  void _onSendMessages(
    SendMessagesEvent event,
    Emitter<MessageState> emit,
  ) async {
    try {
      final result = await _sendMessagesUseCase(event.params);
      result.fold((failure) => emit(ErrorState(failure: failure)), (messageId) {
        log(
          "Отправлено сообщение с id = ${messageId} - ответ на: ${event.params.replyToMsgId}",
        );

        add(
          LoadHistoryEvent(
            MessageParams(
              receiver: event.params.receiver,
              messageId: 0,
              limit: 30,
            ),
          ),
        );
      });
    } catch (e) {
      emit(ErrorState(failure: ExceptionFailure()));
    }
  }

  void _onNewMessage(NewMessageEvent event, Emitter<MessageState> emit) {
    print('<< VLog - MessageBloc - _onNewMessage >>');
  }

  void _onDeleteMessages(
    DeleteMessagesEvent event,
    Emitter<MessageState> emit,
  ) async {
    try {
      final result = await _deleteMessagesUseCase(event.params);
      result.fold((failure) => emit(ErrorState(failure: failure)), (success) {
        if (state is SuccessState) {
          final updated =
              (state as SuccessState).messages
                  .where((m) => !event.params.messageIds.contains(m.id))
                  .toList();
          emit(SuccessState(messages: updated));
        }
      });
    } catch (e) {
      print(e);
      emit(ErrorState(failure: ExceptionFailure()));
    }
  }

  void _onSendMedia(SendMediaEvent event, Emitter<MessageState> emit) async {
    print('<< VLog - MessageBloc - _onSendMedia START >>');

    try {
      final file = File(event.path);
      final mimeType = lookupMimeType(event.path) ?? 'application/octet-stream';
      final fileName = file.uri.pathSegments.last;

      String fileType = 'file';
      int duration = 0;
      int width = 0;
      int height = 0;

      // Определяем тип файла (фото, видео, аудио и т.д.)
      if (mimeType.startsWith('image/')) {
        fileType = 'photo';
      } else if (mimeType.startsWith('video/') ||
          mimeType.startsWith('audio/')) {
        // Запрашиваем метаданные через ffmpeg_helper
        final info = await FFMpegHelper.instance.runProbe(file.path);

        // 1) Пробуем взять общую длительность из info?.getDuration()
        final infoDurationStr = info?.getDuration();
        if (infoDurationStr != null) {
          duration = double.tryParse(infoDurationStr)?.round() ?? 0;
        }

        // 2) Если всё ещё 0, пробуем достать "duration" напрямую из formatProperties
        if (duration == 0) {
          final formatProps = info?.getFormatProperties();
          if (formatProps != null) {
            final formatDurationStr = formatProps['duration']?.toString();
            if (formatDurationStr != null) {
              duration = double.tryParse(formatDurationStr)?.round() ?? 0;
            }
          }
        }

        // 3) Если всё ещё 0, ищем стрим, у которого есть поле 'duration'
        if (duration == 0) {
          final streams = info?.getStreams() ?? [];
          if (streams.isNotEmpty) {
            final durationStream = streams.firstWhere(
              (s) => s.getAllProperties()?['duration'] != null,
              orElse: () => StreamInformation({}),
            );
            final streamDurationStr =
                durationStream.getAllProperties()?['duration']?.toString();
            if (streamDurationStr != null) {
              duration = double.tryParse(streamDurationStr)?.round() ?? 0;
            }
          }
        }

        // Пытаемся получить ширину/высоту (из первого стрима, где codec_type == 'video')
        final streams = info?.getStreams() ?? [];
        final videoStream = streams.firstWhere(
          (s) => s.getAllProperties()?['codec_type'] == 'video',
          orElse: () => StreamInformation({}),
        );

        width =
            int.tryParse(
              videoStream.getAllProperties()?['width']?.toString() ?? '',
            ) ??
            0;
        height =
            int.tryParse(
              videoStream.getAllProperties()?['height']?.toString() ?? '',
            ) ??
            0;

        fileType = mimeType.startsWith('video/') ? 'video' : 'audio';
      }

      // Формируем объект Media с нужными параметрами
      final media = Media(
        fileType: fileType,
        mimeType: mimeType,
        fileName: fileName,
        duration: duration,
        width: width,
        height: height,
      );

      // Отправляем медиа
      final result = await _sendMediaUseCase(
        SendMediaParams(
          receiver: event.receiver,
          file: event.file,
          media: media,
          message: event.message,
          replyToMsgId: event.replyToMsgId,
        ),
      );

      result.fold(
        (failure) {
          print('<< VLog - Ошибка при отправке медиа: $failure >>');
          emit(ErrorState(failure: failure));
        },
        (success) {
          print('<< VLog - Медиа успешно отправлено! >>');
          print('Тип: $fileType | MIME: $mimeType | Name: $fileName');
          print('Длительность: $duration | ${width}x$height');
          add(
            LoadHistoryEvent(
              MessageParams(receiver: event.receiver, messageId: 0, limit: 30),
            ),
          );
        },
      );
    } catch (e) {
      print('<< VLog - Exception в _onSendMedia: $e >>');
      emit(ErrorState(failure: ExceptionFailure()));
    }
  }
}
