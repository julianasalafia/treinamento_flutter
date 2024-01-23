import 'package:flutter_triple/flutter_triple.dart';

class DateTripleStore extends Store<DateTime> {
  DateTripleStore() : super(DateTime.now());

  void nextDate() {
    final newState = state.add(const Duration(days: 1));
    update(newState);
  }

  void previousDate() {
    final newState = state.subtract(const Duration(days: 1));
    update(newState);
  }

  void changeDate(DateTime newDate) {
    update(newDate);
  }
}
