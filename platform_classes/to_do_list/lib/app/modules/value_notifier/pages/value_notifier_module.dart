import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_list/app/modules/value_notifier/controllers/form_vn_controller.dart';
import 'package:to_do_list/app/modules/value_notifier/pages/add_task_vn_page.dart';
import 'package:to_do_list/app/modules/value_notifier/pages/home_vn_page.dart';
import 'package:to_do_list/app/modules/value_notifier/stores/add_task_vn_store.dart';
import 'package:to_do_list/app/modules/value_notifier/stores/date_vn_store.dart';
import 'package:to_do_list/app/modules/value_notifier/stores/tasks_vn_store.dart';

class ValueNotifierModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(DateVnStore.new);
    i.addSingleton(
      () => TasksVnStore(
        repository: i(),
      ),
    );
    i.add(
      () => AddTaskVnStore(
        repository: i(),
      ),
    );
    i.add(
      () => FormVnController(
        addTaskVnStore: i(),
        tasksVnStore: i(),
        dateVnStore: i(),
        overlayService: i(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => HomeVnPage(
        dateVnStore: Modular.get<DateVnStore>(),
        tasksVnStore: Modular.get<TasksVnStore>(),
      ),
    );
    r.child(
      '/add',
      child: (context) => AddTaskVnPage(
        controller: Modular.get<FormVnController>(),
      ),
    );
  }
}
