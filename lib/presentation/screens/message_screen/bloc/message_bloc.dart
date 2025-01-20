import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/domain/entities/message.dart';
import 'package:voo_su/domain/usecases/message/get_history_usecase.dart';

part 'message_event.dart';

part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final GetHistoryUseCase _getHistoryUseCase;

  MessageBloc(this._getHistoryUseCase) : super(InitialState()) {
    on<MessageEvent>(_onLoadHistory);
  }

  void _onLoadHistory(MessageEvent event, Emitter<MessageState> emit) async {
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
}
