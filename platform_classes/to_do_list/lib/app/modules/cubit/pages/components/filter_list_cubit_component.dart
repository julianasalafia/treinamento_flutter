import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/task_model.dart';
import '../../../../widgets/filter_item_widget.dart';
import '../../stores/states/tasks_cubit_state.dart';
import '../../stores/tasks_cubit_store.dart';

class FilterListCubitComponent extends StatelessWidget {
  const FilterListCubitComponent({super.key, required this.tasksCubitStore});

  final TasksCubitStore tasksCubitStore;

  void filterTask(TaskStatus status) {
    tasksCubitStore.filterTasksStatus(status);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: tasksCubitStore,
        builder: (_, TasksCubitState state) {
          return SizedBox(
            height: 20,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                FilterItemWidget(
                  title: 'Todas',
                  isSelected: state.taskStatus == null,
                  notificationCount: state.currentDateTasks.length,
                  onTap: tasksCubitStore.clearStatusFilter,
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
