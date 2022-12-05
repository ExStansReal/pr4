import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'clicker_state.dart';

class ClickerCubit extends Cubit<ClickerState> {
  ClickerCubit() : super(ClickInitial());

  int count = 0;
  bool type = true;
  List<String> logs = [];

  void increment() {
    count += type ? 1 : 2;

    logs.add("Увеличение ${type ? 1 : 2}");
    emit(Click(count, logs));
  }

  void decrement() {
    count -= type ? 1 : 2;

    logs.add("Уменьшение ${type ? 1 : 2}");
    emit(Click(count, logs));
  }

  void changeTheme() {
    type = !type;
    logs.add("Измнение темы на ${type ? 'светлую' : 'тёмную'}");
    emit(Click(count, logs));
  }
}
