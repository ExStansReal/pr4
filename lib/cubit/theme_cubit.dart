import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  bool them = true;

  void changeTheme() {
    them = !them;
    emit(them ? ThemeMode.light : ThemeMode.dark);
  }
}
