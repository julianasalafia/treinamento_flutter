import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_list/app/core/shared/utils/string_extension.dart';
import 'package:to_do_list/app/modules/triple/pages/components/filter_list_triple_component.dart';
import 'package:to_do_list/app/modules/triple/pages/components/task_list_triple_component.dart';

import '../../../core/shared/utils/app_formatters.dart';
import '../../../widgets/header_widget.dart';
import '../../../widgets/home_app_bar_widget.dart';
import '../stores/date_triple_store.dart';
import '../stores/tasks_triple_store.dart';

class HomeTriplePage extends StatefulWidget {
  const HomeTriplePage({
    super.key,
    required this.dateTripleStore,
    required this.tasksTripleStore,
  });

  final DateTripleStore dateTripleStore;
  final TasksTripleStore tasksTripleStore;

  @override
  State<HomeTriplePage> createState() => _HomeTriplePageState();
}

class _HomeTriplePageState extends State<HomeTriplePage> {
  DateTripleStore get dateStore => widget.dateTripleStore;
  TasksTripleStore get tasksStore => widget.tasksTripleStore;
  late final VoidCallback dateObserver;

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
    dateObserver = dateStore.observer(
      onState: reloadTasksOnDateChange,
    );
  }

  void reloadTasksOnDateChange(DateTime date) {
    tasksStore.filterTasksDate(dateStore.state);
  }

  @override
  void dispose() {
    dateObserver();
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
        title: AnimatedBuilder(
          animation: dateStore.selectState,
          builder: (_, __) {
            final date = dateStore.state;
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
            AnimatedBuilder(
              animation: dateStore.selectState,
              builder: (_, __) {
                return HeaderWidget(
                  onAddTap: navigateToForm,
                  title: headerTitle,
                  subtitle: headerSubtitle.capitalize(),
                );
              },
            ),
            const SizedBox(height: 20),
            FilterListTripleComponent(tasksTripleStore: tasksStore),
            const SizedBox(height: 20),
            Expanded(
                child: TaskListTripleComponent(
              tasksTripleStore: tasksStore,
            )),
          ],
        ),
      ),
    );
  }
}
