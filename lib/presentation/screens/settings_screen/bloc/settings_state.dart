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

class SettingsNotifySettingsState extends SettingsState {
  final NotifySettings privateChatsSettings;
  final NotifySettings groupChatsSettings;

  SettingsNotifySettingsState({
    required this.privateChatsSettings,
    required this.groupChatsSettings,
  });

  @override
  List<Object?> get props => [privateChatsSettings, groupChatsSettings];
}

class SettingsErrorState extends SettingsState {
  final Failure failure;

  SettingsErrorState({required this.failure});

  @override
  List<Object?> get props => [failure];
}

class SettingsProfileUpdatedState extends SettingsState {
  final bool success;

  SettingsProfileUpdatedState({required this.success});

  @override
  List<Object?> get props => [success];
}

class SettingsLightThemeState extends SettingsState {}

class SettingsDarkThemeState extends SettingsState {}
