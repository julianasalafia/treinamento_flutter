import 'package:flutter_modular/flutter_modular.dart';
import '../controllers/form_mobx_controller.dart';
import '../stores/add_task_mobx_store.dart';
import '../stores/date_mobx_store.dart';
import '../stores/tasks_mobx_store.dart';
import 'add_task_mobx_page.dart';
import 'home_mobx_page.dart';

class MobxModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(DateMobxStore.new);
    i.addSingleton(
      () => TasksMobxStore(
        repository: i(),
      ),
    );
    i.add(
      () => AddTaskMobxStore(
        repository: i(),
      ),
    );
    i.add(
      () => FormMobxController(
        addTaskMobxStore: i(),
        tasksMobxStore: i(),
        dateMobxStore: i(),
        overlayService: i(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => HomeMobxPage(
        dateMobxStore: Modular.get<DateMobxStore>(),
        tasksMobxStore: Modular.get<TasksMobxStore>(),
      ),
    );
    r.child(
      '/add',
      child: (context) => AddTaskMobxPage(
        controller: Modular.get<FormMobxController>(),
      ),
    );
  }
}
