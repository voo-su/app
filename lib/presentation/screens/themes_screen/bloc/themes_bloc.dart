import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'themes_event.dart';
import 'themes_state.dart';

class ThemesBloc extends Bloc<ThemesEvent, ThemesState> {
  ThemesBloc() : super(ThemesLightState()) {
    on<ThemesChanged>(_onThemeChanged);
    _loadTheme();
  }

  Future<void> _onThemeChanged(
    ThemesChanged event,
    Emitter<ThemesState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLightTheme", event.isLight);

    emit(event.isLight ? ThemesLightState() : ThemesDarkState());
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    bool isLight = prefs.getBool("isLightTheme") ?? true;
    add(ThemesChanged(isLight));
  }
}
