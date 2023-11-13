import '../../../../core/models/task_model.dart';

class TasksCnState {
  const TasksCnState({
    required this.allTasks,
    required this.currentDateTasks,
    required this.filteredTasks,
    required this.taskStatus,
  });

  factory TasksCnState.initialState() {
    return const TasksCnState(
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

  TasksCnState copyWith({
    List<TaskModel>? allTasks,
    List<TaskModel>? currentDateTasks,
    List<TaskModel>? filteredTasks,
    TaskStatus? taskStatus,
  }) {
    return TasksCnState(
      allTasks: allTasks ?? this.allTasks,
      currentDateTasks: currentDateTasks ?? this.currentDateTasks,
      filteredTasks: filteredTasks ?? this.filteredTasks,
      taskStatus: taskStatus,
    );
  }
}

class LoadingTasksCnState extends TasksCnState {
  const LoadingTasksCnState()
      : super(
          allTasks: const [],
          currentDateTasks: const [],
          filteredTasks: const [],
          taskStatus: null,
        );
}

class ErrorTasksCnState extends TasksCnState {
  final String message;

  const ErrorTasksCnState(
    this.message,
  ) : super(
          allTasks: const [],
          currentDateTasks: const [],
          filteredTasks: const [],
          taskStatus: null,
        );
}
