import 'package:flutter/material.dart';

class DateCnStore extends ChangeNotifier {
  DateTime _state;
  DateTime get state => _state;

  DateCnStore() : _state = DateTime.now();

  void nextDate() {
    _state = _state.add(const Duration(days: 1));
    notifyListeners();
  }

  void previousDate() {
    _state = _state.subtract(const Duration(days: 1));
    notifyListeners();
  }

  void changeDate(DateTime newDate) {
    _state = newDate;
    notifyListeners();
  }
}
