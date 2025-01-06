part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoggedFail extends AuthState {
  final Failure failure;

  AuthLoggedFail(this.failure);

  @override
  List<Object> get props => [failure];
}

class AuthLoginLogged extends AuthState {
  final Login login;

  AuthLoginLogged(this.login);

  @override
  List<Object> get props => [login];
}
