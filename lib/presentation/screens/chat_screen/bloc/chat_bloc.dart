import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/domain/entities/chat.dart';
import 'package:voo_su/domain/usecases/chat/get_chats_usecase.dart';

part 'chat_event.dart';

part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetChatsUseCase _getChatsUseCase;

  ChatBloc(this._getChatsUseCase) : super(ChatInitial()) {
    on<Chats>(_onLoadChats);
  }

  void _onLoadChats(Chats event, Emitter<ChatState> emit) async {
    try {
      emit(ChatLoading());
      final result = await _getChatsUseCase(event.params);
      result.fold(
        (failure) {
          emit(ChatError(failure: failure));
        },
        (chatResponse) {
          emit(ChatLoaded(
            chats: chatResponse.chats,
            params: event.params,
          ));
        },
      );
    } catch (e) {
      emit(ChatError(failure: ExceptionFailure()));
    }
  }
}
