import 'package:flutter/cupertino.dart';
import 'package:to_do_list/app/core/repositories/add_task_param.dart';
import 'package:to_do_list/app/modules/change_notifier/stores/states/add_task_cn_state.dart';
import '../../../core/repositories/task_repository.dart';

class AddTaskCnStore extends ValueNotifier<AddTaskCnState> {
  final TaskRepository repository;

  AddTaskCnStore({required this.repository})
      : super(const InitialAddTaskCnState());

  bool get isSuccess => value is SuccessAddTaskCnState;

  Future<void> add(AddTaskParam param) async {
    value = const LoadingAddTaskCnState();

    Future.delayed(const Duration(seconds: 1));
    repository.addTask(param);

    value = const SuccessAddTaskCnState();
  }
}
