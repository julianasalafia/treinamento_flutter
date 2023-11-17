import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/form_bloc_controller.dart';
import '../stores/add_task_bloc_store.dart';
import '../stores/date_bloc_store.dart';
import '../stores/tasks_bloc_store.dart';
import 'add_task_bloc_page.dart';
import 'home_bloc_page.dart';

class BlocModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(DateBlocStore.new);
    i.addSingleton(
      () => TasksBlocStore(
        repository: i(),
      ),
    );
    i.add(
      () => AddTaskBlocStore(
        repository: i(),
      ),
    );
    i.add(
      () => FormBlocController(
        addTaskBlocStore: i(),
        tasksBlocStore: i(),
        dateBlocStore: i(),
        overlayService: i(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => HomeBlocPage(
        dateBlocStore: Modular.get<DateBlocStore>(),
        tasksBlocStore: Modular.get<TasksBlocStore>(),
      ),
    );
    r.child(
      '/add',
      child: (context) => AddTaskBlocPage(
        controller: Modular.get<FormBlocController>(),
      ),
    );
  }
}
