import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/form_cubit_controller.dart';
import '../stores/add_task_cubit_store.dart';
import '../stores/date_cubit_store.dart';
import '../stores/tasks_cubit_store.dart';
import 'add_task_cubit_page.dart';
import 'home_cubit_page.dart';

class CubitModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(DateCubitStore.new);
    i.addSingleton(
      () => TasksCubitStore(
        repository: i(),
      ),
    );
    i.add(
      () => AddTaskCubitStore(
        repository: i(),
      ),
    );
    i.add(
      () => FormCubitController(
        addTaskCubitStore: i(),
        tasksCubitStore: i(),
        dateCubitStore: i(),
        overlayService: i(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => HomeCubitPage(
        dateCubitStore: Modular.get<DateCubitStore>(),
        tasksCubitStore: Modular.get<TasksCubitStore>(),
      ),
    );
    r.child(
      '/add',
      child: (context) => AddTaskCubitPage(
        controller: Modular.get<FormCubitController>(),
      ),
    );
  }
}
