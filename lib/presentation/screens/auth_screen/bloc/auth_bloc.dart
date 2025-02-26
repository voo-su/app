import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/domain/usecases/auth/login_usecase.dart';
import 'package:voo_su/domain/usecases/auth/logout_usecase.dart';
import 'package:voo_su/domain/usecases/auth/verify_usecase.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final VerifyUseCase _verifyUseCase;
  final LogoutUseCase _logoutUseCase;

  AuthBloc(this._loginUseCase, this._verifyUseCase, this._logoutUseCase)
    : super(InitialState()) {
    on<LoginEvent>(_onLogin);
    on<VerifyEvent>(_onVerify);
    on<LogoutEvent>(_onLogout);
  }

  void _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoadingState());
      final result = await _loginUseCase(event.email);
      result.fold(
        (failure) => emit(ErrorState(failure: failure)),
        (success) => emit(SuccessState()),
      );
    } catch (e) {
      emit(ErrorState(failure: ExceptionFailure()));
    }
  }

  void _onVerify(VerifyEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoadingState());
      final result = await _verifyUseCase(event.code);
      result.fold(
        (failure) => emit(ErrorState(failure: failure)),
        (success) => emit(SuccessState()),
      );
    } catch (e) {
      emit(ErrorState(failure: ExceptionFailure()));
    }
  }

  void _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(LoadingState());
    print("bloc 53");
    final result = await _logoutUseCase();
    print("bloc 55 - $result");
    result.fold(
      (failure) => emit(ErrorState(failure: failure)),
      (_) => emit(LoggedOutState()),
    );
  }
}
