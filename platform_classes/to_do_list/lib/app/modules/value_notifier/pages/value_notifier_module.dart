import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_list/app/modules/value_notifier/pages/add_task_vn_page.dart';
import 'package:to_do_list/app/modules/value_notifier/pages/home_vn_page.dart';
import 'package:to_do_list/app/modules/value_notifier/store/date_vn_store.dart';

class ValueNotifierModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(DateVnStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => HomeVnPage(
        dateVnStore: Modular.get<DateVnStore>(),
      ),
    );
    r.child('/add', child: (context) => const AddTaskVnPage());
  }
}
