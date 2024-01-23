import 'package:flutter_triple/flutter_triple.dart';
import 'package:to_do_list/app/core/models/task_model.dart';
import 'package:to_do_list/app/modules/triple/stores/states/tasks_triple_state.dart';

import '../../../core/repositories/task_repository.dart';

class TasksTripleStore extends Store<TasksTripleState> {
  final TaskRepository repository;

  TasksTripleStore({required this.repository}) : super(TasksTripleState.initialState());

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
    setLoading(true);
    await Future.delayed(const Duration(seconds: 1));

    try {
      final tasks = await repository.getTasks();

      final newState = state.copyWith(
        allTasks: tasks,
        taskStatus: state.taskStatus,
      );
      update(newState);

      filterTasksDate(date);
    } catch (e) {
      setError(e.toString());
    }
  }

  void filterTasksDate(DateTime date) {
    final tasks = state.allTasks;

    final dateToFilter = _resetHour(date);

    final newCurrentTasks = tasks.where((e) {
      final initial = _resetHour(e.initialDate);
      return initial.isAtSameMomentAs(dateToFilter);
    }).toList();

    final newState = state.copyWith(
      taskStatus: state.taskStatus,
      currentDateTasks: newCurrentTasks,
      filteredTasks: newCurrentTasks,
    );
    update(newState);
  }

  void clearStatusFilter() {
    final newState = state.copyWith(
      filteredTasks: state.currentDateTasks,
    );
    update(newState);
  }

  void filterTasksStatus(TaskStatus status) {
    final tasks = state.currentDateTasks;

    final filteredTasks = tasks.where((e) {
      return e.status == status;
    }).toList();

    final newState = state.copyWith(
      taskStatus: status,
      filteredTasks: filteredTasks,
    );
    update(newState);
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
