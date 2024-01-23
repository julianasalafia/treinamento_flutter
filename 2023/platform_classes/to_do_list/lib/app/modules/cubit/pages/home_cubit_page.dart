import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_list/app/core/shared/utils/string_extension.dart';

import '../../../core/shared/utils/app_formatters.dart';
import '../../../widgets/header_widget.dart';
import '../../../widgets/home_app_bar_widget.dart';
import '../stores/date_cubit_store.dart';
import '../stores/tasks_cubit_store.dart';
import 'components/filter_list_cubit_component.dart';
import 'components/task_list_cubit_component.dart';

class HomeCubitPage extends StatefulWidget {
  const HomeCubitPage({
    super.key,
    required this.dateCubitStore,
    required this.tasksCubitStore,
  });

  final DateCubitStore dateCubitStore;
  final TasksCubitStore tasksCubitStore;

  @override
  State<HomeCubitPage> createState() => _HomeCubitPageState();
}

class _HomeCubitPageState extends State<HomeCubitPage> {
  DateCubitStore get dateStore => widget.dateCubitStore;
  TasksCubitStore get tasksStore => widget.tasksCubitStore;
  late final StreamSubscription _dateSubscription;

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
    tasksStore.getTasks(dateStore.state);
    _dateSubscription = dateStore.stream.listen(reloadTasksOnDateChange);
  }

  void reloadTasksOnDateChange(DateTime date) {
    tasksStore.filterTasksDate(date);
  }

  @override
  void dispose() {
    _dateSubscription.cancel();
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
        onPreviousTap: dateStore.previousDate,
        onNextTap: dateStore.nextDate,
        onTitleTap: dateStore.changeDate,
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
            FilterListCubitComponent(tasksCubitStore: tasksStore),
            const SizedBox(height: 20),
            Expanded(
                child: TaskListCubitComponent(
              tasksCubitStore: tasksStore,
            )),
          ],
        ),
      ),
    );
  }
}
