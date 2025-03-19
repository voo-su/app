import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/cupertino.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/domain/entities/chat.dart';
import 'package:voo_su/domain/entities/notify_settings.dart';
import 'package:voo_su/domain/usecases/account/update_notify_settings_usecase.dart';
import 'package:voo_su/domain/usecases/chat/get_chats_usecase.dart';
import 'package:voo_su/generated/grpc_pb/account.pb.dart';
import 'package:voo_su/generated/grpc_pb/common/common.pb.dart';

part 'chat_event.dart';

part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetChatsUseCase _getChatsUseCase;
  final UpdateNotifySettingsUseCase _updateNotifySettingsUseCase;

  ChatBloc(this._getChatsUseCase, this._updateNotifySettingsUseCase)
    : super(InitialState()) {
    on<ChatEvent>(_onLoadChats);
    on<ChatUpdateNotifySettingsEvent>(_onUpdateNotifySettings);
  }

  void _onLoadChats(ChatEvent event, Emitter<ChatState> emit) async {
    try {
      emit(LoadingState());
      final result = await _getChatsUseCase(event.params);
      result.fold(
        (failure) => emit(ErrorState(failure: failure)),
        (success) => emit(SuccessState(chats: success.chats)),
      );
    } catch (e) {
      emit(ErrorState(failure: ExceptionFailure()));
    }
  }

  void _onUpdateNotifySettings(
    ChatUpdateNotifySettingsEvent event,
    Emitter<ChatState> emit,
  ) async {
    try {
      final entity = NotifyEntity();
      switch (event.chatType) {
        case 1:
          NotifyEntity(chat: EntityChat(chatId: Int64(event.id)));
          break;
        case 2:
          NotifyEntity(group: EntityGroup(groupId: Int64(event.id)));
          break;
      }
      final result = await _updateNotifySettingsUseCase(
        UpdateNotifySettings(
          entity: entity,
          settings: EntityNotifySettings(
            muteUntil: 2147483647,
            showPreviews: true,
            silent: false,
          ),
        ),
      );
      result.fold(
        (failure) => emit(ErrorState(failure: failure)),
        (success) => {},
      );
    } catch (e) {
      emit(ErrorState(failure: ExceptionFailure()));
    }
  }
}
