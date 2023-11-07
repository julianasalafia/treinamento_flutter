import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_list/app/modules/home/home_module.dart';
import 'package:to_do_list/app/modules/value_notifier/pages/value_notifier_module.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module('/home', module: HomeModule());
    r.module('/vn', module: ValueNotifierModule());
  }
}
