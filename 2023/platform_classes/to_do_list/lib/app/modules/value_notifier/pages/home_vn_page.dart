import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_list/app/modules/value_notifier/pages/components/filter_list_component.dart';
import 'package:to_do_list/app/modules/value_notifier/pages/components/task_list_component.dart';
import 'package:to_do_list/app/core/shared/utils/app_formatters.dart';
import 'package:to_do_list/app/core/shared/utils/string_extension.dart';
import 'package:to_do_list/app/modules/value_notifier/stores/date_vn_store.dart';
import 'package:to_do_list/app/modules/value_notifier/stores/tasks_vn_store.dart';
import 'package:to_do_list/app/widgets/header_widget.dart';
import 'package:to_do_list/app/widgets/home_app_bar_widget.dart';

class HomeVnPage extends StatefulWidget {
  const HomeVnPage({
    super.key,
    required this.dateVnStore,
    required this.tasksVnStore,
  });

  final DateVnStore dateVnStore;
  final TasksVnStore tasksVnStore;

  @override
  State<HomeVnPage> createState() => _HomeVnPageState();
}

class _HomeVnPageState extends State<HomeVnPage> {
  DateVnStore get dateStore => widget.dateVnStore;
  TasksVnStore get tasksStore => widget.tasksVnStore;

  String get headerTitle {
    final dayMessage = AppFormatters.dayMessage(dateStore.value);

    if (dayMessage != null) {
      return 'Tarefas de $dayMessage';
    }
    return 'Tarefas';
  }

  String get headerSubtitle {
    return AppFormatters.completeDay(dateStore.value).capitalize();
  }

  @override
  void initState() {
    super.initState();
    tasksStore.getTasks(dateStore.value);
    dateStore.addListener(reloadTasksOnDateChange);
  }

  void reloadTasksOnDateChange() {
    tasksStore.filterTasksDate(dateStore.value);
  }

  @override
  void dispose() {
    dateStore.removeListener(reloadTasksOnDateChange);
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
        title: ValueListenableBuilder(
          valueListenable: dateStore,
          builder: (_, date, __) {
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
            ValueListenableBuilder(
              valueListenable: dateStore,
              builder: (_, date, __) {
                return HeaderWidget(
                  onAddTap: navigateToForm,
                  title: headerTitle,
                  subtitle: headerSubtitle.capitalize(),
                );
              },
            ),
            const SizedBox(height: 20),
            FilterListComponent(tasksVnStore: tasksStore),
            const SizedBox(height: 20),
            Expanded(
                child: TaskListComponent(
              tasksVnStore: tasksStore,
            )),
          ],
        ),
      ),
    );
  }
}
