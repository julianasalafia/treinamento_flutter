import 'package:bank_project/app/utils/helpers/person_type.dart';
import 'package:bank_project/app/view/controllers/register_page_controller.dart';
import 'package:bank_project/app/view/pages/sign_up_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../services/address_service.dart';

class WelcomePageController extends ChangeNotifier {
  final AddressService _addressService;

  WelcomePageController({required AddressService addressService}) : _addressService = addressService;


  void navigateToSignUp(PersonType personType) {
    if (personType == PersonType.physical) {
      final physicalPersonViewModel =
          PhysicalPersonSignUpPageViewModel.create(address: AddressController(addressService: _addressService));
      Modular.to.pushNamed('/sign-up', arguments: physicalPersonViewModel);
    }

    if (personType == PersonType.legal) {
      final legalPersonViewModel = LegalPersonSignUpPageViewModel.create(address: AddressController(addressService: _addressService));
      Modular.to.pushNamed('/sign-up', arguments: legalPersonViewModel);
    }
  }

  void getData(SignUpPageViewModel viewModel) {
    print(viewModel);
  }
}
