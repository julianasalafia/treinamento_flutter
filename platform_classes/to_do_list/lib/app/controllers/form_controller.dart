import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/app/core/shared/utils/app_formatters.dart';
import 'package:to_do_list/app/core/shared/utils/string_extension.dart';

class FormController {
  FormController() {
    formKey = GlobalKey<FormState>();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    dateController = TextEditingController();
    initHourController = TextEditingController();
    endHourController = TextEditingController();
  }
  late final GlobalKey<FormState> formKey;
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;
  late final TextEditingController dateController;
  late final TextEditingController initHourController;
  late final TextEditingController endHourController;
  DateTime? _selectedDate;
  TimeOfDay? _initHour;
  TimeOfDay? _endHour;

  Future<void> add() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    print('add');
  }

  void changeDate(DateTime newDate) {
    final value = AppFormatters.completeDay(newDate);
    dateController.text = value.capitalize();
    _selectedDate = newDate;
  }

  void changeInitHour(TimeOfDay newTime) {
    final endHour = _endHour;

    if (endHour != null) {
      final initDate = _generateDate(time: newTime);
      final endDate = _generateDate(time: endHour);

      if (initDate.isAfter(endDate)) return;
    }
    final value = AppFormatters.formatHourFromTime(newTime);
    initHourController.text = value;
    _initHour = newTime;
  }

  void changeEndHour(TimeOfDay newTime) {
    final initHour = _initHour;

    if (initHour != null) {
      final initDate = _generateDate(time: initHour);
      final endDate = _generateDate(time: newTime);

      if (initDate.isAfter(endDate)) return;
    }

    final value = AppFormatters.formatHourFromTime(newTime);
    endHourController.text = value;
    _endHour = newTime;
  }

  static DateTime _generateDate({required TimeOfDay time, DateTime? date}) {
    final baseDate = date ?? DateTime.now();

    return baseDate.copyWith(
      hour: time.hour,
      minute: time.minute,
      second: 0,
      millisecond: 0,
      microsecond: 0,
    );
  }
}
