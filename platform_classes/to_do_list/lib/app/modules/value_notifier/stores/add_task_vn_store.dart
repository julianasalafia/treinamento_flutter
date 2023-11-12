import 'package:flutter/cupertino.dart';
import 'package:to_do_list/app/core/repositories/add_task_param.dart';
import 'package:to_do_list/app/modules/value_notifier/stores/states/add_task_vn_state.dart';

import '../../../core/repositories/task_repository.dart';

class AddTaskVnStore extends ValueNotifier<AddTaskVnState> {
  final TaskRepository repository;

  AddTaskVnStore({required this.repository})
      : super(const InitialAddTaskVnState());

  bool get isSuccess => value is SuccessAddTaskVnState;

  Future<void> add(AddTaskParam param) async {
    value = const LoadingAddTaskVnState();

    Future.delayed(const Duration(seconds: 1));
    repository.addTask(param);

    value = const SuccessAddTaskVnState();
  }
}
