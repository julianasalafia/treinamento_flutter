import 'package:flutter/material.dart';
import 'package:to_do_list/app/core/models/task_model.dart';
import '../../../../widgets/filter_item_widget.dart';
import '../../stores/tasks_cn_store.dart';

class FilterListComponent extends StatelessWidget {
  const FilterListComponent({super.key, required this.tasksCnStore});

  final TasksCnStore tasksCnStore;

  void filterTask(TaskStatus status) {
    tasksCnStore.filterTasksStatus(status);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: tasksCnStore,
        builder: (_, __) {
          final state = tasksCnStore.state;
          return SizedBox(
            height: 20,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                FilterItemWidget(
                  title: 'Todas',
                  isSelected: state.taskStatus == null,
                  notificationCount: state.currentDateTasks.length,
                  onTap: tasksCnStore.clearStatusFilter,
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
