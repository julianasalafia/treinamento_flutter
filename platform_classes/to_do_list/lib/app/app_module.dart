import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_list/app/core/repositories/task_repository.dart';
import 'package:to_do_list/app/core/services/local_storage/hive_local_storage_service.dart';
import 'package:to_do_list/app/core/services/overlay/asuka_overlay_service.dart';
import 'package:to_do_list/app/modules/bloc/pages/bloc_module.dart';
import 'package:to_do_list/app/modules/change_notifier/pages/change_notifier_module.dart';
import 'package:to_do_list/app/modules/cubit/pages/cubit_module.dart';
import 'package:to_do_list/app/modules/home/home_module.dart';
import 'package:to_do_list/app/modules/value_notifier/pages/value_notifier_module.dart';

import 'core/services/local_storage/i_local_storage_service.dart';
import 'core/services/overlay/i_overlay_service.dart';
import 'modules/triple/pages/triple_module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<IOverlayService>(AsukaOverlayService.new);
    i.addSingleton(() => TaskRepository(i()));
    i.addSingleton<ILocalStorageService>(HiveLocalStorageService.new);
  }

  @override
  void routes(RouteManager r) {
    r.module('/home', module: HomeModule());
    r.module('/vn', module: ValueNotifierModule());
    r.module('/cn', module: ChangeNotifierModule());
    r.module('/bloc', module: BlocModule());
    r.module('/cubit', module: CubitModule());
    r.module('/triple', module: TripleModule());
  }
}
