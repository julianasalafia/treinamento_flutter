import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_list/app/components/filter_list_component.dart';
import 'package:to_do_list/app/components/task_list_component.dart';
import 'package:to_do_list/app/core/shared/utils/app_formatters.dart';
import 'package:to_do_list/app/core/shared/utils/string_extension.dart';
import 'package:to_do_list/app/modules/value_notifier/pages/add_task_vn_page.dart';
import 'package:to_do_list/app/widgets/header_widget.dart';
import 'package:to_do_list/app/widgets/home_app_bar_widget.dart';

class HomeVnPage extends StatefulWidget {
  const HomeVnPage({super.key});

  @override
  State<HomeVnPage> createState() => _HomeVnPageState();
}

class _HomeVnPageState extends State<HomeVnPage> {
  void navigateToForm() {
    Modular.to.pushNamed('add');
  }

  String get headerTitle {
    final dayMessage = AppFormatters.dayMessage(DateTime.now());

    if (dayMessage != null) {
      return 'Tarefas de $dayMessage';
    }
    return 'Tarefas';
  }

  String get headerSubtitle {
    return AppFormatters.completeDay(DateTime.now()).capitalize();
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
              subtitle: headerSubtitle.capitalize(),
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
