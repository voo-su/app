import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/domain/entities/contact.dart';
import 'package:voo_su/domain/entities/message.dart';
import 'package:voo_su/domain/usecases/chat/delete_messages_usecase.dart';
import 'package:voo_su/domain/usecases/chat/get_history_usecase.dart';
import 'package:voo_su/domain/usecases/chat/send_messages_usecase.dart';

part 'message_event.dart';

part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final GetHistoryUseCase _getHistoryUseCase;
  final SendMessagesUseCase _sendMessagesUseCase;
  final DeleteMessagesUseCase _deleteMessagesUseCase;

  MessageBloc(
    this._getHistoryUseCase,
    this._sendMessagesUseCase,
    this._deleteMessagesUseCase,
  ) : super(InitialState()) {
    on<LoadHistoryEvent>(_onLoadHistory);
    on<SendMessagesEvent>(_onSendMessages);
    on<NewMessageEvent>(_onNewMessage);
    on<DeleteMessagesEvent>(_onDeleteMessages);
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
              chatType: event.params.chatType,
              receiverId: event.params.receiverId,
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
}
