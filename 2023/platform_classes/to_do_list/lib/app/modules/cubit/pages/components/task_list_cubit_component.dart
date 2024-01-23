import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../themes/color_extension.dart';
import '../../../../widgets/task_card_widget.dart';
import '../../stores/states/tasks_cubit_state.dart';
import '../../stores/tasks_cubit_store.dart';

class TaskListCubitComponent extends StatelessWidget {
  const TaskListCubitComponent({super.key, required this.tasksCubitStore});

  final TasksCubitStore tasksCubitStore;

  @override
  Widget build(BuildContext context) {
    final colorExtension = Theme.of(context).extension<ColorExtension>()!;
    return BlocBuilder(
        bloc: tasksCubitStore,
        builder: (_, TasksCubitState state) {
          if (state is LoadingTasksCubitState) {
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

          if (state is ErrorTasksCubitState) {
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
                onTap: () => tasksCubitStore.doneTask(task),
                onDismiss: () => tasksCubitStore.archiveTask(task),
              );
            },
          );
        });
  }
}
