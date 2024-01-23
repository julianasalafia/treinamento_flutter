import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppFormatters {
  static String formatHourFromTime(TimeOfDay time) {
    final date = DateTime.now().copyWith(hour: time.hour, minute: time.minute);
    final formattedValue = DateFormat('h:mm a', 'pt_BR').format(date);

    return formattedValue;
  }

  static String formatHourFromDate(DateTime date) {
    final formattedValue = DateFormat('h:mm a', 'pt_BR').format(date);

    return formattedValue;
  }

  static String? dayMessage(DateTime date) {
    final handledValue = _resetHour(date);
    final today = _resetHour(DateTime.now());
    final tomorrow = today.add(const Duration(days: 1));
    final yesterday = today.subtract(const Duration(days: 1));

    if (handledValue.isAtSameMomentAs(today)) {
      return 'Hoje';
    } else if (handledValue.isAtSameMomentAs(tomorrow)) {
      return 'Amanhã';
    } else if (handledValue.isAtSameMomentAs(yesterday)) {
      return 'Ontem';
    }
    return null;
  }

  static String onlyDay(DateTime date) {
    final formatter = DateFormat("d 'de' MMMM", 'pt_BR');
    final formattedValue = formatter.format(date);

    return formattedValue;
  }

  static String completeDay(DateTime date) {
    final formatter = DateFormat("EEEE, d 'de' MMMM", 'pt_BR');
    final formattedValue = formatter.format(date);

    return formattedValue;
  }

  static DateTime _resetHour(DateTime date) {
    return date.copyWith(
      hour: 0,
      minute: 0,
      second: 0,
      millisecond: 0,
      microsecond: 0,
    );
  }
}
