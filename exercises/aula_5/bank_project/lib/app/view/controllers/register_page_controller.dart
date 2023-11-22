import 'package:bank_project/app/utils/helpers/person_type.dart';
import 'package:bank_project/app/view/pages/sign_up_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterPageController extends ChangeNotifier {
  RegisterPageController();

  void navigateToSignUp(PersonType personType) {
    if (personType == PersonType.physical) {
      final physicalPersonViewModel = PhysicalPersonSignUpPageViewModel.create();
      Modular.to.pushNamed('/sign-up', arguments: physicalPersonViewModel);
    }

    if (personType == PersonType.legal) {
      final legalPersonViewModel = LegalPersonSignUpPageViewModel.create();
      Modular.to.pushNamed('/sign-up', arguments: legalPersonViewModel);
    }
  }
}
