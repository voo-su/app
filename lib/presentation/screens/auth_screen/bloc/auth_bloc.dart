import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/domain/entities/auth/login.dart';
import 'package:voo_su/domain/usecases/auth/login_usecase.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;

  AuthBloc(
    this._loginUseCase,
  ) : super(AuthInitial()) {
    on<LoginAuth>(_onLogin);
  }

  void _onLogin(LoginAuth event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());
      final result = await _loginUseCase(event.params);
      result.fold(
        (failure) => emit(AuthLoggedFail(failure)),
        (login) => emit(AuthLoginLogged(login)),
      );
    } catch (e) {
      emit(AuthLoggedFail(ExceptionFailure()));
    }
  }
}
