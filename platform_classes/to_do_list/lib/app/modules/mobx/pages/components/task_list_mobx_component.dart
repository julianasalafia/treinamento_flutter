import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shimmer/shimmer.dart';
import 'package:to_do_list/app/themes/color_extension.dart';
import '../../../../widgets/task_card_widget.dart';
import '../../stores/states/tasks_mobx_state.dart';
import '../../stores/tasks_mobx_store.dart';

class TaskListMobxComponent extends StatelessWidget {
  const TaskListMobxComponent({super.key, required this.tasksMobxStore});

  final TasksMobxStore tasksMobxStore;

  @override
  Widget build(BuildContext context) {
    final colorExtension = Theme.of(context).extension<ColorExtension>()!;
    return Observer(builder: (_) {
      final state = tasksMobxStore.state;

      if (state is LoadingTasksMobxState) {
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
      }

      if (state is ErrorTasksMobxState) {
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
            onTap: () => tasksMobxStore.doneTask(task),
            onDismiss: () => tasksMobxStore.archiveTask(task),
          );
        },
      );
    });
  }
}
