part of 'contact_bloc.dart';

@immutable
abstract class ContactState extends Equatable {}

class InitialState extends ContactState {
  @override
  List<Object> get props => [];
}

class LoadingState extends ContactState {
  @override
  List<Object> get props => [];
}

class SuccessState extends ContactState {
  final List<Contact> contacts;

  SuccessState({
    required this.contacts,
  });

  @override
  List<Object> get props => [contacts];
}

class ErrorState extends ContactState {
  final Failure failure;

  ErrorState({
    required this.failure,
  });

  @override
  List<Object> get props => [];
}
