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

  Future<void> add() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    print('add');
  }

  void changeDate(DateTime newDate) {
    final value = AppFormatters.completeDay(newDate);
    dateController.text = value.capitalize();
  }

  void changeInitHour(TimeOfDay newTime) {
    final value = AppFormatters.formatHourFromTime(newTime);
    initHourController.text = value;
  }

  void changeEndHour(TimeOfDay newTime) {
    final value = AppFormatters.formatHourFromTime(newTime);
    endHourController.text = value;
  }
}
