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

  ChatBloc(this._getChatsUseCase) : super(InitialState()) {
    on<ChatEvent>(_onLoadChats);
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
}
