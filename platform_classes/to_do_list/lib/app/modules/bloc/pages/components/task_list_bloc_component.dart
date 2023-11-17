import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:to_do_list/app/modules/bloc/stores/events/tasks_bloc_event.dart';
import '../../../../themes/color_extension.dart';
import '../../../../widgets/task_card_widget.dart';
import '../../stores/states/tasks_bloc_state.dart';
import '../../stores/tasks_bloc_store.dart';

class TaskListBlocComponent extends StatelessWidget {
  const TaskListBlocComponent({super.key, required this.tasksBlocStore});

  final TasksBlocStore tasksBlocStore;

  @override
  Widget build(BuildContext context) {
    final colorExtension = Theme.of(context).extension<ColorExtension>()!;
    return BlocBuilder(
      bloc: tasksBlocStore,
      builder: (_, TasksBlocState state) {
        if (state is LoadingTasksBlocState) {
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

        if (state is ErrorTasksBlocState) {
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
              onTap: () => tasksBlocStore.add(DoneTaskBlocEvent(task)),
              onDismiss: () => tasksBlocStore.add(ArchiveTaskBlocEvent(task)),
            );
          },
        );
      },
    );
  }
}
