part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SettingsInitialState extends SettingsState {}

class SettingsLoadingState extends SettingsState {}

class SettingsSuccessState extends SettingsState {
  final Account account;

  SettingsSuccessState({required this.account});

  @override
  List<Object?> get props => [account];
}

class SettingsErrorState extends SettingsState {
  final Failure failure;

  SettingsErrorState({required this.failure});

  @override
  List<Object?> get props => [failure];
}
