import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/domain/entities/contact.dart';
import 'package:voo_su/domain/entities/message.dart';
import 'package:voo_su/domain/usecases/chat/delete_messages_usecase.dart';
import 'package:voo_su/domain/usecases/chat/get_group_chat_usecase.dart';
import 'package:voo_su/domain/usecases/chat/get_history_usecase.dart';
import 'package:voo_su/domain/usecases/chat/get_members_usecase.dart';
import 'package:voo_su/domain/usecases/chat/send_messages_usecase.dart';

part 'message_event.dart';

part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final GetHistoryUseCase _getHistoryUseCase;
  final SendMessagesUseCase _sendMessagesUseCase;
  final DeleteMessagesUseCase _deleteMessagesUseCase;
  final GetGroupChatUseCase _getGroupChatUseCase;
  final GetMembersUseCase _getMembersUseCase;

  MessageBloc(
    this._getHistoryUseCase,
    this._sendMessagesUseCase,
    this._deleteMessagesUseCase,
    this._getGroupChatUseCase,
    this._getMembersUseCase,
  ) : super(InitialState()) {
    on<LoadHistoryEvent>(_onLoadHistory);
    on<SendMessagesEvent>(_onSendMessages);
    on<NewMessageEvent>(_onNewMessage);
    on<DeleteMessagesEvent>(_onDeleteMessages);
    on<LoadGroupInfoEvent>(_onLoadGroupInfo);
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

  void _onLoadGroupInfo(
    LoadGroupInfoEvent event,
    Emitter<MessageState> emit,
  ) async {
    try {
      emit(LoadingState());

      final groupResult = await _getGroupChatUseCase(event.groupId);
      final membersResult = await _getMembersUseCase(event.groupId);

      groupResult.fold((failure) => emit(ErrorState(failure: failure)), (
        group,
      ) {
        membersResult.fold((failure) => emit(ErrorState(failure: failure)), (
          members,
        ) {
          emit(
            GroupInfoState(
              name: group.name,
              avatar: group.avatar,
              members:
                  members.items
                      .map(
                        (item) => Contact(
                          id: item.id.toInt(),
                          username: item.username,
                          avatar: item.avatar,
                          name: item.name,
                          surname: item.surname,
                        ),
                      )
                      .toList(),
            ),
          );
        });
      });
    } catch (e) {
      emit(ErrorState(failure: ExceptionFailure()));
    }
  }
}
