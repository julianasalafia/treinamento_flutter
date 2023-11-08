import '../../../../core/models/task_model.dart';

class TasksVnState {
  const TasksVnState({
    required this.allTasks,
    required this.currentDateTasks,
    required this.filteredTasks,
    required this.taskStatus,
  });

  factory TasksVnState.initialState() {
    return const TasksVnState(
      allTasks: [],
      currentDateTasks: [],
      filteredTasks: [],
      taskStatus: null,
    );
  }

  final List<TaskModel> allTasks;
  final List<TaskModel> currentDateTasks;
  final List<TaskModel> filteredTasks;
  final TaskStatus? taskStatus;

  int get openedCount => _filterLength(TaskStatus.open);
  int get closedCount => _filterLength(TaskStatus.closed);
  int get archivedCount => _filterLength(TaskStatus.archived);

  int _filterLength(TaskStatus status) {
    final tasks = currentDateTasks.where((e) => e.status == status);
    return tasks.length;
  }

  TasksVnState copyWith({
    List<TaskModel>? allTasks,
    List<TaskModel>? currentDateTasks,
    List<TaskModel>? filteredTasks,
    TaskStatus? taskStatus,
  }) {
    return TasksVnState(
      allTasks: allTasks ?? this.allTasks,
      currentDateTasks: currentDateTasks ?? this.currentDateTasks,
      filteredTasks: filteredTasks ?? this.filteredTasks,
      taskStatus: taskStatus,
    );
  }
}

class LoadingTasksVnState extends TasksVnState {
  const LoadingTasksVnState()
      : super(
          allTasks: const [],
          currentDateTasks: const [],
          filteredTasks: const [],
          taskStatus: null,
        );
}

class ErrorTasksVnState extends TasksVnState {
  final String message;

  const ErrorTasksVnState(
    this.message,
  ) : super(
          allTasks: const [],
          currentDateTasks: const [],
          filteredTasks: const [],
          taskStatus: null,
        );
}
