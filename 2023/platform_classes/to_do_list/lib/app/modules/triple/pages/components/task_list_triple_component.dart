import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../themes/color_extension.dart';
import '../../../../widgets/task_card_widget.dart';
import '../../stores/states/tasks_triple_state.dart';
import '../../stores/tasks_triple_store.dart';

class TaskListTripleComponent extends StatelessWidget {
  const TaskListTripleComponent({super.key, required this.tasksTripleStore});

  final TasksTripleStore tasksTripleStore;

  @override
  Widget build(BuildContext context) {
    final colorExtension = Theme.of(context).extension<ColorExtension>()!;

    return ScopedBuilder(
        store: tasksTripleStore,
        onError: (_, error) {
          return Center(
            child: Text(error),
          );
        },
        onLoading: (_) {
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
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                      ),
                    );
                  }),
            ),
          );
        },
        onState: (_, TasksTripleState state) {
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
                onTap: () => tasksTripleStore.doneTask(task),
                onDismiss: () => tasksTripleStore.archiveTask(task),
              );
            },
          );
        });
  }
}
