import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(foregroundColor: Colors.white),
      brightness: Brightness.light);

  static final _darkTheme = ThemeData(
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(foregroundColor: Colors.orange),
      brightness: Brightness.dark);

  void changTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}
