import 'package:flutter/material.dart';
import 'package:to_do_list/app/core/models/task_model.dart';
import 'package:to_do_list/app/modules/value_notifier/stores/tasks_vn_store.dart';
import '../../../../widgets/filter_item_widget.dart';

class FilterListComponent extends StatelessWidget {
  const FilterListComponent({super.key, required this.tasksVnStore});

  final TasksVnStore tasksVnStore;

  void filterTask(TaskStatus status) {
    tasksVnStore.filterTasksStatus(status);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: tasksVnStore,
        builder: (_, state, __) {
          return SizedBox(
            height: 20,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                FilterItemWidget(
                  title: 'Todas',
                  isSelected: state.taskStatus == null,
                  notificationCount: state.currentDateTasks.length,
                  onTap: tasksVnStore.clearStatusFilter,
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
