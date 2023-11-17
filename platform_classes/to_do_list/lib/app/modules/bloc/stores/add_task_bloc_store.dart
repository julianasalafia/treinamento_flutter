import 'package:flutter/material.dart';
import 'package:to_do_list/app/modules/bloc/stores/states/add_task_bloc_state.dart';
import '../../../core/repositories/add_task_param.dart';
import '../../../core/repositories/task_repository.dart';

class AddTaskBlocStore extends ValueNotifier<AddTaskBlocState> {
  final TaskRepository repository;

  AddTaskBlocStore({required this.repository})
      : super(const InitialAddTaskBlocState());

  bool get isSuccess => value is SuccessAddTaskBlocState;

  Future<void> add(AddTaskParam param) async {
    value = const LoadingAddTaskBlocState();

    Future.delayed(const Duration(seconds: 1));
    repository.addTask(param);

    value = const SuccessAddTaskBlocState();
  }
}
