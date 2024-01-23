import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:to_do_list/app/modules/value_notifier/stores/states/tasks_vn_state.dart';
import 'package:to_do_list/app/modules/value_notifier/stores/tasks_vn_store.dart';
import 'package:to_do_list/app/themes/color_extension.dart';
import '../../../../widgets/task_card_widget.dart';

class TaskListComponent extends StatelessWidget {
  const TaskListComponent({super.key, required this.tasksVnStore});

  final TasksVnStore tasksVnStore;

  @override
  Widget build(BuildContext context) {
    final colorExtension = Theme.of(context).extension<ColorExtension>()!;
    return ValueListenableBuilder(
        valueListenable: tasksVnStore,
        builder: (_, state, __) {
          if (state is LoadingTasksVnState) {
            return SizedBox(
              child: Shimmer.fromColors(
                baseColor: colorExtension.shimmerBaseColor,
                highlightColor: colorExtension.shimmerHighlightColor,
                child: ListView.separated(
                    itemCount: 50,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (_, __) {
                      return Container(
                        width: double.infinity,
                        height: 125,
                        decoration: BoxDecoration(
                          color: colorExtension.shimmerBaseColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                      );
                    }),
              ),
            );
          }

          if (state is ErrorTasksVnState) {
            return Center(
              child: Text(state.message),
            );
          }
          return ListView.separated(
            itemCount: state.filteredTasks.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (_, index) {
              final task = state.filteredTasks.elementAt(index);
              return TaskCardWidget(
                key: ValueKey('${task.id}-${task.status.name}'),
                isDone: task.isDone,
                title: task.title,
                description: task.description,
                initialDate: task.initialDate,
                endDate: task.endDate,
                onTap: () => tasksVnStore.doneTask(task),
                onDismiss: () => tasksVnStore.archiveTask(task),
              );
            },
          );
        });
  }
}
