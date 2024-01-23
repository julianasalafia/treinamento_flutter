import '../../../../core/models/task_model.dart';

class TasksBlocState {
  const TasksBlocState({
    required this.allTasks,
    required this.currentDateTasks,
    required this.filteredTasks,
    required this.taskStatus,
  });

  factory TasksBlocState.initialState() {
    return const TasksBlocState(
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

  TasksBlocState copyWith({
    List<TaskModel>? allTasks,
    List<TaskModel>? currentDateTasks,
    List<TaskModel>? filteredTasks,
    TaskStatus? taskStatus,
  }) {
    return TasksBlocState(
      allTasks: allTasks ?? this.allTasks,
      currentDateTasks: currentDateTasks ?? this.currentDateTasks,
      filteredTasks: filteredTasks ?? this.filteredTasks,
      taskStatus: taskStatus,
    );
  }
}

class LoadingTasksBlocState extends TasksBlocState {
  const LoadingTasksBlocState()
      : super(
          allTasks: const [],
          currentDateTasks: const [],
          filteredTasks: const [],
          taskStatus: null,
        );
}

class ErrorTasksBlocState extends TasksBlocState {
  final String message;

  const ErrorTasksBlocState(
    this.message,
  ) : super(
          allTasks: const [],
          currentDateTasks: const [],
          filteredTasks: const [],
          taskStatus: null,
        );
}
