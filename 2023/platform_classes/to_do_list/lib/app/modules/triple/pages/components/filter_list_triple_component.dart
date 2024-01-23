import 'package:flutter/material.dart';

import '../../../../core/models/task_model.dart';
import '../../../../widgets/filter_item_widget.dart';
import '../../stores/tasks_triple_store.dart';

class FilterListTripleComponent extends StatelessWidget {
  const FilterListTripleComponent({super.key, required this.tasksTripleStore});

  final TasksTripleStore tasksTripleStore;

  void filterTask(TaskStatus status) {
    tasksTripleStore.filterTasksStatus(status);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: tasksTripleStore.selectState,
        builder: (_, state, __) {
          final state = tasksTripleStore.state;
          return SizedBox(
            height: 20,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                FilterItemWidget(
                  title: 'Todas',
                  isSelected: state.taskStatus == null,
                  notificationCount: state.currentDateTasks.length,
                  onTap: tasksTripleStore.clearStatusFilter,
                ),
                const SizedBox(width: 6),
                const VerticalDivider(),
                const SizedBox(width: 6),
                FilterItemWidget(
                  title: 'Abertas',
                  isSelected: state.taskStatus == TaskStatus.open,
                  notificationCount: state.openedCount,
                  onTap: () => filterTask(TaskStatus.open),
                ),
                const SizedBox(width: 12),
                FilterItemWidget(
                  title: 'Fechadas',
                  isSelected: state.taskStatus == TaskStatus.closed,
                  notificationCount: state.closedCount,
                  onTap: () => filterTask(TaskStatus.closed),
                ),
                const SizedBox(width: 12),
                FilterItemWidget(
                  title: 'Arquivadas',
                  isSelected: state.taskStatus == TaskStatus.archived,
                  notificationCount: state.archivedCount,
                  onTap: () => filterTask(TaskStatus.archived),
                ),
              ],
            ),
          );
        });
  }
}
