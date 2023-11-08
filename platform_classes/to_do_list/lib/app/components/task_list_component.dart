import 'package:flutter/material.dart';
import 'package:to_do_list/app/modules/value_notifier/stores/tasks_vn_store.dart';
import '../widgets/task_card_widget.dart';

class TaskListComponent extends StatelessWidget {
  const TaskListComponent({super.key, required this.tasksVnStore});

  final TasksVnStore tasksVnStore;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: tasksVnStore,
        builder: (_, tasks, __) {
          return ListView.separated(
            itemCount: tasks.filteredTasks.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (_, index) {
              final task = tasks.filteredTasks.elementAt(index);
              return TaskCardWidget(
                isDone: task.isDone,
                title: task.title,
                description: task.description,
                initialDate: task.initialDate,
                endDate: task.endDate,
                onTap: () {},
              );
            },
          );
        });
  }
}
