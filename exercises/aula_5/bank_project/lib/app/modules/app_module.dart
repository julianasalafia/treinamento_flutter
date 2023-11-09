import 'package:flutter_modular/flutter_modular.dart';

import '../view/pages/welcome_page.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    // TODO: implement binds
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const WelcomePage(),
    );
  }
}
