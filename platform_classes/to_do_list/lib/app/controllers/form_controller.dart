import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  late final titleController;
  late final descriptionController;
  late final dateController;
  late final initHourController;
  late final endHourController;

  Future<void> add() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    print('add');
  }

  void changeDate(DateTime newDate) {
    dateController.text = newDate.toString();
  }

  void changeInitHour(TimeOfDay newTime) {
    initHourController.text = newTime.toString();
  }

  void changeEndHour(TimeOfDay newTime) {
    endHourController.text = newTime.toString();
  }
}
