part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;

  LoginEvent({required this.email});
}

class VerifyEvent extends AuthEvent {
  final String code;

  VerifyEvent({required this.code});
}

class LogoutEvent extends AuthEvent {}
