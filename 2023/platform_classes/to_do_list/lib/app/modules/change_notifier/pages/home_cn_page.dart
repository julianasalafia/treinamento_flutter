import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_list/app/core/shared/utils/app_formatters.dart';
import 'package:to_do_list/app/core/shared/utils/string_extension.dart';
import 'package:to_do_list/app/modules/change_notifier/pages/components/filter_list_component.dart';
import 'package:to_do_list/app/modules/change_notifier/pages/components/task_list_component.dart';
import 'package:to_do_list/app/widgets/header_widget.dart';
import 'package:to_do_list/app/widgets/home_app_bar_widget.dart';
import '../stores/date_cn_store.dart';
import '../stores/tasks_cn_store.dart';

class HomeCnPage extends StatefulWidget {
  const HomeCnPage({
    super.key,
    required this.dateCnStore,
    required this.tasksCnStore,
  });

  final DateCnStore dateCnStore;
  final TasksCnStore tasksCnStore;

  @override
  State<HomeCnPage> createState() => _HomeCnPageState();
}

class _HomeCnPageState extends State<HomeCnPage> {
  DateCnStore get dateStore => widget.dateCnStore;
  TasksCnStore get tasksStore => widget.tasksCnStore;

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
    dateStore.addListener(reloadTasksOnDateChange);
  }

  void reloadTasksOnDateChange() {
    tasksStore.filterTasksDate(dateStore.state);
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
        title: AnimatedBuilder(
          animation: dateStore,
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
              animation: dateStore,
              builder: (_, __) {
                return HeaderWidget(
                  onAddTap: navigateToForm,
                  title: headerTitle,
                  subtitle: headerSubtitle.capitalize(),
                );
              },
            ),
            const SizedBox(height: 20),
            FilterListComponent(tasksCnStore: tasksStore),
            const SizedBox(height: 20),
            Expanded(
                child: TaskListComponent(
              tasksCnStore: tasksStore,
            )),
          ],
        ),
      ),
    );
  }
}
