import 'package:flutter/material.dart';
import '../widgets/task_card_widget.dart';

class TaskListComponent extends StatelessWidget {
  const TaskListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) {
        return TaskCardWidget(
          isDone: index.isEven,
          title: 'Title $index',
          description: 'Description $index',
          initialDate: DateTime.now(),
          endDate: DateTime.now(),
          onTap: () {},
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemCount: 30,
    );
  }
}
