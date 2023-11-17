import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/app/modules/bloc/stores/events/tasks_bloc_event.dart';

import '../../../../core/models/task_model.dart';
import '../../../../widgets/filter_item_widget.dart';
import '../../stores/states/tasks_bloc_state.dart';
import '../../stores/tasks_bloc_store.dart';

class FilterListBlocComponent extends StatelessWidget {
  const FilterListBlocComponent({super.key, required this.tasksBlocStore});

  final TasksBlocStore tasksBlocStore;

  void filterTask(TaskStatus status) {
    tasksBlocStore.add(FilterTasksByStatusBlocEvent(status));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: tasksBlocStore,
        builder: (_, TasksBlocState state) {
          return SizedBox(
            height: 20,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                FilterItemWidget(
                  title: 'Todas',
                  isSelected: state.taskStatus == null,
                  notificationCount: state.currentDateTasks.length,
                  onTap: () => tasksBlocStore.add(
                    const ClearFilterByStatusBlocEvent(),
                  ),
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
