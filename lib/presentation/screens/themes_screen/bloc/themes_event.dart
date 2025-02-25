import 'package:equatable/equatable.dart';

abstract class ThemesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ThemesChanged extends ThemesEvent {
  final bool isLight;

  ThemesChanged(this.isLight);

  @override
  List<Object> get props => [isLight];
}
