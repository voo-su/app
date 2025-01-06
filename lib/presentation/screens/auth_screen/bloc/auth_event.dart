part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginAuth extends AuthEvent {
  final AuthLoginParams params;

  LoginAuth(this.params);
}

class VerifyAuth extends AuthEvent {
  final AuthVerifyParams params;

  VerifyAuth(this.params);
}
