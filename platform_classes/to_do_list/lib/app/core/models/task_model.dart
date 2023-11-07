enum TaskStatus { open, closed, archived }

class TaskModel {
  const TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.initialDate,
    required this.endDate,
    required this.isDone,
    required this.status,
  });

  final int id;
  final String title;
  final String description;
  final DateTime initialDate;
  final DateTime endDate;
  final bool isDone;
  final TaskStatus status;
}
