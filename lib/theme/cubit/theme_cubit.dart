import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(lightTheme);

  void changeTheme() {
    state == darkTheme ? emit(lightTheme) : emit(darkTheme);
  }
}

ThemeData darkTheme = ThemeData.dark();

ThemeData lightTheme = ThemeData.light();
