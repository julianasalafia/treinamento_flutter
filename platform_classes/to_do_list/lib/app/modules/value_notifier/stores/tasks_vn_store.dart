import 'package:flutter/cupertino.dart';
import 'package:to_do_list/app/core/models/task_model.dart';

class TasksVnStore extends ValueNotifier<List<TaskModel>> {
  TasksVnStore() : super([]);

  Future<void> getTasks(DateTime date) async {
    final tasks = List.generate(5, (index) {
      return TaskModel(
        title: 'Title $index',
        description: 'Description $index',
        initialDate: date,
        endDate: DateTime.now().add(Duration(minutes: index * 5)),
        isDone: index.isEven,
        id: index,
        status: TaskStatus.values[index % 3],
      );
    });
    value = tasks;
  }
}
