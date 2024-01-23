import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:to_do_list/app/core/shared/utils/app_formatters.dart';
import 'package:to_do_list/app/core/shared/utils/string_extension.dart';
import 'package:to_do_list/app/widgets/header_widget.dart';
import 'package:to_do_list/app/widgets/home_app_bar_widget.dart';
import '../stores/date_mobx_store.dart';
import '../stores/tasks_mobx_store.dart';
import 'components/filter_list_mobx_component.dart';
import 'components/task_list_mobx_component.dart';

class HomeMobxPage extends StatefulWidget {
  const HomeMobxPage({
    super.key,
    required this.dateMobxStore,
    required this.tasksMobxStore,
  });

  final DateMobxStore dateMobxStore;
  final TasksMobxStore tasksMobxStore;

  @override
  State<HomeMobxPage> createState() => _HomeMobxPageState();
}

class _HomeMobxPageState extends State<HomeMobxPage> {
  DateMobxStore get dateStore => widget.dateMobxStore;
  TasksMobxStore get tasksStore => widget.tasksMobxStore;
  late final ReactionDisposer dateReactionDisposer;

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

    dateReactionDisposer = reaction<DateTime>(
      (_) => dateStore.state,
      reloadTasksOnDateChange,
    );
  }

  void reloadTasksOnDateChange(DateTime date) {
    tasksStore.filterTasksDate(date);
  }

  @override
  void dispose() {
    dateReactionDisposer();
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
        title: Observer(
          builder: (_) {
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
            Observer(
              builder: (_) {
                return HeaderWidget(
                  onAddTap: navigateToForm,
                  title: headerTitle,
                  subtitle: headerSubtitle.capitalize(),
                );
              },
            ),
            const SizedBox(height: 20),
            FilterListMobxComponent(tasksMobxStore: tasksStore),
            const SizedBox(height: 20),
            Expanded(
                child: TaskListMobxComponent(
              tasksMobxStore: tasksStore,
            )),
          ],
        ),
      ),
    );
  }
}
