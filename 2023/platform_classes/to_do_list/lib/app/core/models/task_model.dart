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

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      initialDate: DateTime.fromMillisecondsSinceEpoch(map['initialDate']),
      endDate: DateTime.fromMillisecondsSinceEpoch(map['endDate']),
      isDone: map['isDone'],
      status: TaskStatus.values.byName(map['status']),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'initialDate': initialDate.millisecondsSinceEpoch,
      'endDate': initialDate.millisecondsSinceEpoch,
      'isDone': isDone,
      'status': status.name,
    };
  }

  TaskModel copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? initialDate,
    DateTime? endDate,
    bool? isDone,
    TaskStatus? status,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      initialDate: initialDate ?? this.initialDate,
      endDate: endDate ?? this.endDate,
      isDone: isDone ?? this.isDone,
      status: status ?? this.status,
    );
  }
}
