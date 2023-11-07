import 'package:flutter_modular/flutter_modular.dart';
import 'pages/home_page.dart';

class HomeModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const HomePage());
  }
}
