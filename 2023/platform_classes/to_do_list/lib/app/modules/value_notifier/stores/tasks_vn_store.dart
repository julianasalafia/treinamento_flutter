import 'package:flutter/material.dart';
import 'package:to_do_list/app/core/models/task_model.dart';
import 'package:to_do_list/app/modules/value_notifier/stores/states/tasks_vn_state.dart';

import '../../../core/repositories/task_repository.dart';

class TasksVnStore extends ValueNotifier<TasksVnState> {
  final TaskRepository repository;

  TasksVnStore({required this.repository}) : super(TasksVnState.initialState());

  Future<void> doneTask(TaskModel task) async {
    late TaskStatus newStatus;

    if (task.status == TaskStatus.closed) {
      newStatus = TaskStatus.open;
    } else {
      newStatus = TaskStatus.closed;
    }

    final newTask = task.copyWith(status: newStatus, isDone: !task.isDone);
    await repository.updateTask(newTask);

    await getTasks(task.initialDate);
  }

  Future<void> archiveTask(TaskModel task) async {
    late TaskStatus newStatus;

    if (task.status == TaskStatus.archived && task.isDone) {
      newStatus = TaskStatus.closed;
    } else if (task.status == TaskStatus.archived && !task.isDone) {
      newStatus = TaskStatus.open;
    } else {
      newStatus = TaskStatus.archived;
    }

    final newTask = task.copyWith(status: newStatus);
    await repository.updateTask(newTask);

    await getTasks(task.initialDate);
  }

  Future<void> getTasks(DateTime date) async {
    value = const LoadingTasksVnState();
    await Future.delayed(const Duration(seconds: 1));

    try {
      final tasks = await repository.getTasks();

      value = value.copyWith(
        allTasks: tasks,
        taskStatus: value.taskStatus,
      );
      filterTasksDate(date);
    } catch (e) {
      value = ErrorTasksVnState(e.toString());
    }
  }

  void filterTasksDate(DateTime date) {
    final tasks = value.allTasks;

    final dateToFilter = _resetHour(date);

    final newCurrentTasks = tasks.where((e) {
      final initial = _resetHour(e.initialDate);
      return initial.isAtSameMomentAs(dateToFilter);
    }).toList();

    value = value.copyWith(
      taskStatus: value.taskStatus,
      currentDateTasks: newCurrentTasks,
      filteredTasks: newCurrentTasks,
    );
  }

  void clearStatusFilter() {
    value = value.copyWith(
      filteredTasks: value.currentDateTasks,
    );
  }

  void filterTasksStatus(TaskStatus status) {
    final tasks = value.currentDateTasks;

    final filteredTasks = tasks.where((e) {
      return e.status == status;
    }).toList();

    value = value.copyWith(
      taskStatus: status,
      filteredTasks: filteredTasks,
    );
  }

  static DateTime _resetHour(DateTime date) {
    return date.copyWith(
      hour: 0,
      second: 0,
      minute: 0,
      millisecond: 0,
      microsecond: 0,
    );
  }
}
