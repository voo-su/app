part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {}

class InitialState extends AuthState {
  @override
  List<Object> get props => [];
}

class LoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class SuccessState extends AuthState {

  @override
  List<Object> get props => [];
}

class ErrorState extends AuthState {
  final Failure failure;

  ErrorState({
    required this.failure,
  });

  @override
  List<Object> get props => [];
}
