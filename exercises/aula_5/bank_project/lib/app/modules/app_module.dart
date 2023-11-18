import 'package:bank_project/app/view/controllers/welcome_page_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../view/pages/sign_up_page.dart';
import '../view/pages/welcome_page.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
    i.add(WelcomePageController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => WelcomePage(
        controller: Modular.get(),
      ),
    );
    r.child(
      '/sign-up',
      child: (context) => SignUpPage(
        signUpPageViewModel: r.args.data,
      ),
    );
  }
}
