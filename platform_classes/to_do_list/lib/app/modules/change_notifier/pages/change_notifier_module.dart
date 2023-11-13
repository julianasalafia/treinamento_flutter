import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_list/app/modules/change_notifier/controllers/form_cn_controller.dart';
import 'package:to_do_list/app/modules/change_notifier/stores/add_task_cn_store.dart';
import 'package:to_do_list/app/modules/change_notifier/stores/date_cn_store.dart';
import 'package:to_do_list/app/modules/change_notifier/stores/tasks_cn_store.dart';
import 'add_task_cn_page.dart';
import 'home_cn_page.dart';

class ChangeNotifierModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(DateCnStore.new);
    i.addSingleton(
      () => TasksCnStore(
        repository: i(),
      ),
    );
    i.add(
      () => AddTaskCnStore(
        repository: i(),
      ),
    );
    i.add(
      () => FormCnController(
        addTaskCnStore: i(),
        tasksCnStore: i(),
        dateCnStore: i(),
        overlayService: i(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => HomeCnPage(
        dateCnStore: Modular.get<DateCnStore>(),
        tasksCnStore: Modular.get<TasksCnStore>(),
      ),
    );
    r.child(
      '/add',
      child: (context) => AddTaskCnPage(
        controller: Modular.get<FormCnController>(),
      ),
    );
  }
}
