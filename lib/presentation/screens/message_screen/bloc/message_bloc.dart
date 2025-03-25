import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';
import 'package:video_player/video_player.dart';
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

      if (mimeType.startsWith('image/')) {
        fileType = 'photo';
      } else if (mimeType.startsWith('video/')) {
        final controller = VideoPlayerController.file(file);
        await controller.initialize();
        duration = controller.value.duration.inSeconds;
        width = controller.value.size.width.toInt();
        height = controller.value.size.height.toInt();
        await controller.dispose();

        fileType = 'video';
      } else if (mimeType.startsWith('audio/')) {
        fileType = 'audio';
      }

      final media = Media(
        fileType: fileType,
        mimeType: mimeType,
        fileName: fileName,
        duration: duration,
        width: width,
        height: height,
      );

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
