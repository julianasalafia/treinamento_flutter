import 'package:flutter/material.dart';
import 'package:to_do_list/app/core/repositories/add_task_param.dart';
import 'package:to_do_list/app/modules/change_notifier/stores/states/add_task_cn_state.dart';
import '../../../core/repositories/task_repository.dart';

class AddTaskCnStore extends ChangeNotifier {
  final TaskRepository repository;

  AddTaskCnStore({required this.repository})
      : _state = const InitialAddTaskCnState();

  bool get isSuccess => _state is SuccessAddTaskCnState;
  AddTaskCnState _state;
  AddTaskCnState get state => _state;

  Future<void> add(AddTaskParam param) async {
    _state = const LoadingAddTaskCnState();
    notifyListeners();

    Future.delayed(const Duration(seconds: 1));
    repository.addTask(param);

    _state = const SuccessAddTaskCnState();
    notifyListeners();
  }
}
