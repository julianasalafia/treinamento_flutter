import 'package:bank_project/app/services/address_service.dart';
import 'package:bank_project/app/services/http_service_dio.dart';
import 'package:bank_project/app/services/i_http_service.dart';
import 'package:bank_project/app/view/controllers/welcome_page_controller.dart';
import 'package:bank_project/app/view/pages/login/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../view/controllers/register_page_controller.dart';
import '../view/pages/register/register_page.dart';
import '../view/pages/sign_up_page.dart';
import '../view/pages/welcome_page.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
    i.add(WelcomePageController.new);
    i.add(RegisterPageController.new);
    i.add<IHttpService>(HttpServiceDio.new);
    i.add(AddressService.new);
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
      '/login',
      child: (context) => const LoginPage(),
    );
    r.child(
      '/register',
      child: (context) => RegisterPage(
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
