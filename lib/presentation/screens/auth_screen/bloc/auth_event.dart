part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final AuthLoginParams params;

  LoginEvent(this.params);
}

class VerifyEvent extends AuthEvent {
  final AuthVerifyParams params;

  VerifyEvent(this.params);
}
