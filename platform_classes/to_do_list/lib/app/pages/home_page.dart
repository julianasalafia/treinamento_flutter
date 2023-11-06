import 'package:flutter/material.dart';
import 'package:to_do_list/app/components/filter_list_component.dart';
import 'package:to_do_list/app/components/task_list_component.dart';
import 'package:to_do_list/app/core/shared/utils/app_formatters.dart';
import 'package:to_do_list/app/pages/add_task_page.dart';
import 'package:to_do_list/app/widgets/header_widget.dart';
import 'package:to_do_list/app/widgets/home_app_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void navigateToForm() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const AddTaskPage();
        },
      ),
    );
  }

  String get headerTitle {
    final dayMessage = AppFormatters.dayMessage(DateTime.now());

    if (dayMessage != null) {
      return 'Tarefas de $dayMessage';
    }
    return 'Tarefas';
  }

  String get headerSubtitle {
    return AppFormatters.completeDay(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: HomeAppBarWidget(
        title: Text(
          'Hoje',
          style: theme.appBarTheme.titleTextStyle,
        ),
        onPreviousTap: () {},
        onNextTap: () {},
        onTitleTap: (date) {},
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Column(
          children: [
            HeaderWidget(
              onAddTap: navigateToForm,
              title: headerTitle,
              subtitle: headerSubtitle,
            ),
            const SizedBox(height: 20),
            const FilterListComponent(),
            const SizedBox(height: 20),
            const Expanded(child: TaskListComponent()),
          ],
        ),
      ),
    );
  }
}
