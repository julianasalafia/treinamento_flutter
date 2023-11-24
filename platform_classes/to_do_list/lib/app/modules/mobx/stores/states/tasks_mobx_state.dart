import '../../../../core/models/task_model.dart';

class TasksMobxState {
  const TasksMobxState({
    required this.allTasks,
    required this.currentDateTasks,
    required this.filteredTasks,
    required this.taskStatus,
  });

  factory TasksMobxState.initialState() {
    return const TasksMobxState(
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

  TasksMobxState copyWith({
    List<TaskModel>? allTasks,
    List<TaskModel>? currentDateTasks,
    List<TaskModel>? filteredTasks,
    TaskStatus? taskStatus,
  }) {
    return TasksMobxState(
      allTasks: allTasks ?? this.allTasks,
      currentDateTasks: currentDateTasks ?? this.currentDateTasks,
      filteredTasks: filteredTasks ?? this.filteredTasks,
      taskStatus: taskStatus,
    );
  }
}

class LoadingTasksMobxState extends TasksMobxState {
  const LoadingTasksMobxState()
      : super(
          allTasks: const [],
          currentDateTasks: const [],
          filteredTasks: const [],
          taskStatus: null,
        );
}

class ErrorTasksMobxState extends TasksMobxState {
  final String message;

  const ErrorTasksMobxState(
    this.message,
  ) : super(
          allTasks: const [],
          currentDateTasks: const [],
          filteredTasks: const [],
          taskStatus: null,
        );
}
