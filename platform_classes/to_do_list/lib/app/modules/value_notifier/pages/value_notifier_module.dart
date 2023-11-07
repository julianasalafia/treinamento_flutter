import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_list/app/modules/value_notifier/pages/add_task_vn_page.dart';
import 'package:to_do_list/app/modules/value_notifier/pages/home_vn_page.dart';

class ValueNotifierModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const HomeVnPage());
    r.child('/add', child: (context) => const AddTaskVnPage());
  }
}
