import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'clicker_state.dart';

class ClickerCubit extends Cubit<ClickerState> {
  ClickerCubit() : super(ClickInitial()) {
    Timer.periodic(Duration(seconds: 1), (timer) {
      secondCount++;

      if (secondCount >= 5) {
        bool False = false;
        increment(UpdateCount: false);
      }
      emit(state);
    });
  }

  int count = 0;
  bool type = true;
  int secondCount = 0;
  List<String> logs = [];

  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      secondCount++;

      if (secondCount >= 5) {
        bool False = false;
        increment(UpdateCount: false);
      }
      emit(state);
    });
  }

  void SaveDataInSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setStringList('logs', logs);
    prefs.setInt('count', count);
    prefs.setBool('type_theme', type);
  }

  void increment({bool UpdateCount = true}) {
    count += type ? 1 : 2;

    logs.add("Увеличение ${type ? 1 : 2}");
    SaveDataInSharedPreferences();
    if (UpdateCount == true) {
      secondCount = 0;
    }
    emit(Click(count, logs));
  }

  void decrement() {
    count -= type ? 1 : 2;

    logs.add("Уменьшение ${type ? 1 : 2}");

    SaveDataInSharedPreferences();
    secondCount = 0;
    emit(Click(count, logs));
  }

  void changeTheme() {
    type = !type;
    logs.add("Измнение темы на ${type ? 'светлую' : 'тёмную'}");

    SaveDataInSharedPreferences();
    secondCount = 0;
    emit(Click(count, logs));
  }

  void DeleteAllDataInSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.remove('logs');
    prefs.remove('count');
    prefs.remove('type_theme');
    secondCount = 0;
    logs.clear();
    count = 0;
    emit(Click(count, logs));
  }
}
