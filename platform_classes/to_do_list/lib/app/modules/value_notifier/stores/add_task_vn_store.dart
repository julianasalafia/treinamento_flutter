import 'package:flutter/cupertino.dart';
import 'package:to_do_list/app/core/repositories/add_task_param.dart';
import 'package:to_do_list/app/modules/value_notifier/stores/states/add_task_vn_state.dart';

class AddTaskVnStore extends ValueNotifier<AddTaskVnState> {
  AddTaskVnStore() : super(const InitialAddTaskVnState());

  bool get isSuccess => value is SuccessAddTaskVnState;

  Future<void> add(AddTaskParam param) async {
    value = const LoadingAddTaskVnState();

    Future.delayed(const Duration(seconds: 3));

    value = const SuccessAddTaskVnState();
  }
}
