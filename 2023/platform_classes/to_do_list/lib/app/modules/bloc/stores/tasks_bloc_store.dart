import 'package:bloc/bloc.dart';
import 'package:to_do_list/app/core/models/task_model.dart';
import 'package:to_do_list/app/modules/bloc/stores/events/tasks_bloc_event.dart';
import 'package:to_do_list/app/modules/bloc/stores/states/tasks_bloc_state.dart';

import '../../../core/repositories/task_repository.dart';

class TasksBlocStore extends Bloc<TasksBlocEvent, TasksBlocState> {
  final TaskRepository repository;

  TasksBlocStore({required this.repository})
      : super(TasksBlocState.initialState()) {
    on<DoneTaskBlocEvent>((event, _) => _doneTask(event));
    on<ArchiveTaskBlocEvent>((event, _) => _archiveTask(event));
    on<GetTasksBlocEvent>(_getTasks);
    on<FilterTasksByDateBlocEvent>(_filterTasksDate);
    on<FilterTasksByStatusBlocEvent>(_filterTasksStatus);
    on<ClearFilterByStatusBlocEvent>(
      (_, emitter) => _clearStatusFilter(emitter),
    );
  }

  Future<void> _doneTask(DoneTaskBlocEvent event) async {
    late TaskStatus newStatus;
    final task = event.task;

    if (task.status == TaskStatus.closed) {
      newStatus = TaskStatus.open;
    } else {
      newStatus = TaskStatus.closed;
    }

    final newTask = task.copyWith(status: newStatus, isDone: !task.isDone);
    await repository.updateTask(newTask);

    add(GetTasksBlocEvent(task.initialDate));
  }

  Future<void> _archiveTask(ArchiveTaskBlocEvent event) async {
    late TaskStatus newStatus;
    final task = event.task;

    if (task.status == TaskStatus.archived && task.isDone) {
      newStatus = TaskStatus.closed;
    } else if (task.status == TaskStatus.archived && !task.isDone) {
      newStatus = TaskStatus.open;
    } else {
      newStatus = TaskStatus.archived;
    }

    final newTask = task.copyWith(status: newStatus);
    await repository.updateTask(newTask);

    add(GetTasksBlocEvent(task.initialDate));
  }

  Future<void> _getTasks(
      GetTasksBlocEvent event, Emitter<TasksBlocState> emitter) async {
    emitter(const LoadingTasksBlocState());
    await Future.delayed(const Duration(seconds: 1));

    try {
      final tasks = await repository.getTasks();

      final newState = state.copyWith(
        allTasks: tasks,
        taskStatus: state.taskStatus,
      );
      emitter(newState);
      add(FilterTasksByDateBlocEvent(event.date));
    } catch (e) {
      emitter(ErrorTasksBlocState(e.toString()));
    }
  }

  void _filterTasksDate(
      FilterTasksByDateBlocEvent event, Emitter<TasksBlocState> emitter) {
    final tasks = state.allTasks;

    final dateToFilter = _resetHour(event.date);

    final newCurrentTasks = tasks.where((e) {
      final initial = _resetHour(e.initialDate);
      return initial.isAtSameMomentAs(dateToFilter);
    }).toList();

    final newState = state.copyWith(
      taskStatus: state.taskStatus,
      currentDateTasks: newCurrentTasks,
      filteredTasks: newCurrentTasks,
    );
    emitter(newState);
  }

  void _clearStatusFilter(Emitter<TasksBlocState> emitter) {
    final newState = state.copyWith(
      filteredTasks: state.currentDateTasks,
    );
    emitter(newState);
  }

  void _filterTasksStatus(
      FilterTasksByStatusBlocEvent event, Emitter<TasksBlocState> emitter) {
    final tasks = state.currentDateTasks;
    final status = event.status;

    final filteredTasks = tasks.where((e) {
      return e.status == status;
    }).toList();

    final newState = state.copyWith(
      taskStatus: status,
      filteredTasks: filteredTasks,
    );
    emitter(newState);
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
