import 'package:flutter/cupertino.dart';
import 'package:to_do_list/app/core/add_task_param.dart';

class AddTaskVnStore extends ValueNotifier<bool> {
  AddTaskVnStore(super.value);

  bool get isSuccess => value;

  Future<void> add(AddTaskParam param) async {
    value = true;
  }
}
