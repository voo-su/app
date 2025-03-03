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
