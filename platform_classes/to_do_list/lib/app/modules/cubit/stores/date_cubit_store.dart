import 'package:bloc/bloc.dart';

class DateCubitStore extends Cubit<DateTime> {
  DateCubitStore() : super(DateTime.now());

  void nextDate() {
    final newState = state.add(const Duration(days: 1));
    emit(newState);
  }

  void previousDate() {
    final newState = state.subtract(const Duration(days: 1));
    emit(newState);
  }

  void changeDate(DateTime newDate) {
    final newState = newDate;
    emit(newState);
  }
}
