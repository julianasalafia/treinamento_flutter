import 'package:flutter/cupertino.dart';

class DateVnStore extends ValueNotifier<DateTime> {
  DateVnStore() : super(DateTime.now());

  void nextDate() {
    value = value.add(const Duration(days: 1));
  }

  void previousDate() {
    value = value.subtract(const Duration(days: 1));
  }

  void changeDate(DateTime newDate) {
    value = newDate;
  }
}
