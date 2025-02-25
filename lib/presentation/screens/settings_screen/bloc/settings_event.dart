part of 'settings_bloc.dart';


abstract class SettingsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetAccountEvent extends SettingsEvent {}
