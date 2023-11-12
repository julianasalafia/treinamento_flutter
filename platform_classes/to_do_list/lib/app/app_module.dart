import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_list/app/core/services/overlay/asuka_overlay_service.dart';
import 'package:to_do_list/app/modules/home/home_module.dart';
import 'package:to_do_list/app/modules/value_notifier/pages/value_notifier_module.dart';

import 'core/services/overlay/i_overlay_service.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<IOverlayService>(AsukaOverlayService.new);
  }

  @override
  void routes(RouteManager r) {
    r.module('/home', module: HomeModule());
    r.module('/vn', module: ValueNotifierModule());
  }
}
