part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginAuth extends AuthEvent {
  final LoginParams params;

  LoginAuth(this.params);
}

class VerifyAuth extends AuthEvent {
  final VerifyParams params;

  VerifyAuth(this.params);
}
