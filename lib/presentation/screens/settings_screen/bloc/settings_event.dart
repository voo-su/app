part of 'settings_bloc.dart';


abstract class SettingsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetAccountEvent extends SettingsEvent {}

class GetNotifySettingsEvent extends SettingsEvent {}

class UpdateProfileEvent extends SettingsEvent {
  final UpdateProfileParams params;

  UpdateProfileEvent(this.params);

  @override
  List<Object?> get props => [params];
}

class ChangeThemeEvent extends SettingsEvent {
  final bool isLight;
  ChangeThemeEvent(this.isLight);

  @override
  List<Object?> get props => [isLight];
}