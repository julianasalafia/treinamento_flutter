import 'package:flutter_modular/flutter_modular.dart';
import '../controllers/form_triple_controller.dart';
import '../stores/add_task_triple_store.dart';
import '../stores/date_triple_store.dart';
import '../stores/tasks_triple_store.dart';
import 'add_task_triple_page.dart';
import 'home_triple_page.dart';

class TripleModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(DateTripleStore.new);
    i.addSingleton(
      () => TasksTripleStore(
        repository: i(),
      ),
    );
    i.add(
      () => AddTaskTripleStore(
        repository: i(),
      ),
    );
    i.add(
      () => FormTripleController(
        addTaskTripleStore: i(),
        tasksTripleStore: i(),
        dateTripleStore: i(),
        overlayService: i(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => HomeTriplePage(
        dateTripleStore: Modular.get<DateTripleStore>(),
        tasksTripleStore: Modular.get<TasksTripleStore>(),
      ),
    );
    r.child(
      '/add',
      child: (context) => AddTaskTriplePage(
        controller: Modular.get<FormTripleController>(),
      ),
    );
  }
}
