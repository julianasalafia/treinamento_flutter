import '../../../../core/models/task_model.dart';

class TasksStates {
  const TasksStates({
    required this.allTasks,
    required this.currentDateTasks,
    required this.filteredTasks,
    required this.taskStatus,
  });

  factory TasksStates.initialState() {
    return const TasksStates(
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

  TasksStates copyWith({
    final List<TaskModel>? allTasks,
    final List<TaskModel>? currentDateTasks,
    final List<TaskModel>? filteredTasks,
    final TaskStatus? taskStatus,
  }) {
    return TasksStates(
      allTasks: allTasks ?? this.allTasks,
      currentDateTasks: currentDateTasks ?? this.currentDateTasks,
      filteredTasks: filteredTasks ?? this.filteredTasks,
      taskStatus: taskStatus,
    );
  }
}
