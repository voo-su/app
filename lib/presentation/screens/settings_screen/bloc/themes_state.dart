import 'package:equatable/equatable.dart';

abstract class ThemesState extends Equatable {
  @override
  List<Object> get props => [];
}

class ThemesLightState extends ThemesState {}

class ThemesDarkState extends ThemesState {}
