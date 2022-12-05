part of 'clicker_cubit.dart';

@immutable
abstract class ClickerState {}

class ClickInitial extends ClickerState {}

class Click extends ClickerState {
  int count;
  List<String> logs;

  Click(this.count, this.logs);
}
