import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:to_do_list/app/core/models/task_model.dart';
import '../../../../widgets/filter_item_widget.dart';
import '../../stores/tasks_mobx_store.dart';

class FilterListMobxComponent extends StatelessWidget {
  const FilterListMobxComponent({super.key, required this.tasksMobxStore});

  final TasksMobxStore tasksMobxStore;

  void filterTask(TaskStatus status) {
    tasksMobxStore.filterTasksStatus(status);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      final state = tasksMobxStore.state;
      return SizedBox(
        height: 20,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            FilterItemWidget(
              title: 'Todas',
              isSelected: state.taskStatus == null,
              notificationCount: state.currentDateTasks.length,
              onTap: tasksMobxStore.clearStatusFilter,
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
