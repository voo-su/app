import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/domain/entities/account.dart';
import 'package:voo_su/domain/usecases/account/get_acccount_usecase.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetAccountUsecase _getAccountUseCase;

  SettingsBloc(this._getAccountUseCase) : super(SettingsInitialState()) {
    on<GetAccountEvent>(_onGetAccount);
  }

  Future<void> _onGetAccount(
    GetAccountEvent event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      emit(SettingsLoadingState());
      final result = await _getAccountUseCase(AccountParams());

      result.fold(
        (failure) => emit(SettingsErrorState(failure: failure)),
        (success) => emit(SettingsSuccessState(account: success.account)),
      );
    } catch (e) {
      emit(SettingsErrorState(failure: ExceptionFailure()));
    }
  }
}
