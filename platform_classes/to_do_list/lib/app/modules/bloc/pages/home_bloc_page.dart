import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_list/app/core/shared/utils/string_extension.dart';
import 'package:to_do_list/app/modules/bloc/stores/events/date_bloc_event.dart';
import 'package:to_do_list/app/modules/bloc/stores/events/tasks_bloc_event.dart';

import '../../../core/shared/utils/app_formatters.dart';
import '../../../widgets/header_widget.dart';
import '../../../widgets/home_app_bar_widget.dart';
import '../stores/date_bloc_store.dart';
import '../stores/tasks_bloc_store.dart';
import 'components/filter_list_bloc_component.dart';
import 'components/task_list_bloc_component.dart';

class HomeBlocPage extends StatefulWidget {
  final DateBlocStore dateBlocStore;
  final TasksBlocStore tasksBlocStore;

  const HomeBlocPage({
    super.key,
    required this.dateBlocStore,
    required this.tasksBlocStore,
  });

  @override
  State<HomeBlocPage> createState() => _HomeBlocPageState();
}

class _HomeBlocPageState extends State<HomeBlocPage> {
  DateBlocStore get dateStore => widget.dateBlocStore;
  TasksBlocStore get tasksStore => widget.tasksBlocStore;
  late final StreamSubscription dateSubscription;

  String get headerTitle {
    final dayMessage = AppFormatters.dayMessage(dateStore.state);

    if (dayMessage != null) {
      return 'Tarefas de $dayMessage';
    }
    return 'Tarefas';
  }

  String get headerSubtitle {
    return AppFormatters.completeDay(dateStore.state).capitalize();
  }

  @override
  void initState() {
    super.initState();
    tasksStore.add(GetTasksBlocEvent(dateStore.state));
    dateSubscription = dateStore.stream.listen(reloadTasksOnDateChange);
  }

  void reloadTasksOnDateChange(DateTime date) {
    tasksStore.add(FilterTasksByDateBlocEvent(date));
  }

  @override
  void dispose() {
    dateSubscription.cancel();
    super.dispose();
  }

  void navigateToForm() {
    Modular.to.pushNamed('add');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: HomeAppBarWidget(
        onPreviousTap: () => dateStore.add(const PreviousDateBlocEvent()),
        onNextTap: () => dateStore.add(const NextDateBlocEvent()),
        onTitleTap: (date) => dateStore.add(ChangeDateBlocEvent(date)),
        title: BlocBuilder(
          bloc: dateStore,
          builder: (_, DateTime date) {
            return Text(
              AppFormatters.completeDay(date).capitalize(),
              style: theme.appBarTheme.titleTextStyle,
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Column(
          children: [
            BlocBuilder(
              bloc: dateStore,
              builder: (_, DateTime date) {
                return HeaderWidget(
                  onAddTap: navigateToForm,
                  title: headerTitle,
                  subtitle: headerSubtitle.capitalize(),
                );
              },
            ),
            const SizedBox(height: 20),
            FilterListBlocComponent(tasksBlocStore: tasksStore),
            const SizedBox(height: 20),
            Expanded(
                child: TaskListBlocComponent(
              tasksBlocStore: tasksStore,
            )),
          ],
        ),
      ),
    );
  }
}
