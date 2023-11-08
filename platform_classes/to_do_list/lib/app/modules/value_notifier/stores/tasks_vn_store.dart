import 'dart:math';

import 'package:flutter/material.dart';
import 'package:to_do_list/app/core/models/task_model.dart';
import 'package:to_do_list/app/modules/value_notifier/stores/states/tasks_vn_state.dart';

class TasksVnStore extends ValueNotifier<TasksVnState> {
  TasksVnStore() : super(TasksVnState.initialState());

  Future<void> getTasks(DateTime date) async {
    value = const LoadingTasksVnState();
    await Future.delayed(const Duration(seconds: 3));

    // value = const ErrorTasksVnState('Random Error');
    // await Future.delayed(const Duration(seconds: 3));

    try {
      final random = Random();

      final tasks = List.generate(50, (index) {
        final now = DateTime.now();
        final initialDate = now.add(Duration(days: random.nextInt(25) - 1));

        return TaskModel(
          title: 'Title $index',
          description: 'Description $index',
          initialDate: initialDate,
          endDate: initialDate.add(Duration(minutes: index * 2)),
          isDone: index.isEven,
          id: index,
          status: TaskStatus.values[index % 3],
        );
      });

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
