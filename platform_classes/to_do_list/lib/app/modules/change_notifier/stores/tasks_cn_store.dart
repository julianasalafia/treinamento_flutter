import 'package:flutter/material.dart';
import 'package:to_do_list/app/core/models/task_model.dart';
import 'package:to_do_list/app/modules/change_notifier/stores/states/tasks_cn_state.dart';
import '../../../core/repositories/task_repository.dart';

class TasksCnStore extends ChangeNotifier {
  final TaskRepository repository;
  TasksCnState _state;
  TasksCnState get state => _state;

  TasksCnStore({required this.repository})
      : _state = TasksCnState.initialState();

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
    _state = const LoadingTasksCnState();
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));

    try {
      final tasks = await repository.getTasks();

      _state = _state.copyWith(
        allTasks: tasks,
        taskStatus: _state.taskStatus,
      );

      filterTasksDate(date);
    } catch (e) {
      _state = ErrorTasksCnState(e.toString());
    }
    notifyListeners();
  }

  void filterTasksDate(DateTime date) {
    final tasks = _state.allTasks;

    final dateToFilter = _resetHour(date);

    final newCurrentTasks = tasks.where((e) {
      final initial = _resetHour(e.initialDate);
      return initial.isAtSameMomentAs(dateToFilter);
    }).toList();

    _state = _state.copyWith(
      taskStatus: _state.taskStatus,
      currentDateTasks: newCurrentTasks,
      filteredTasks: newCurrentTasks,
    );
    notifyListeners();
  }

  void clearStatusFilter() {
    _state = _state.copyWith(
      filteredTasks: _state.currentDateTasks,
    );
    notifyListeners();
  }

  void filterTasksStatus(TaskStatus status) {
    final tasks = _state.currentDateTasks;

    final filteredTasks = tasks.where((e) {
      return e.status == status;
    }).toList();

    _state = _state.copyWith(
      taskStatus: status,
      filteredTasks: filteredTasks,
    );
    notifyListeners();
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
