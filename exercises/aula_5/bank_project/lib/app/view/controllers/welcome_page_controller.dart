import 'package:bank_project/app/utils/helpers/person_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../services/address_service.dart';
import '../pages/view_models/legal_person_view_model.dart';
import '../pages/view_models/physical_person_view_model.dart';
import '../pages/view_models/sign_up_page_view_model.dart';
import 'address_controller.dart';

class WelcomePageController extends ChangeNotifier {
  final AddressService _addressService;

  WelcomePageController({required AddressService addressService}) : _addressService = addressService;

  void navigateToSignUp(PersonType personType) {
    if (personType == PersonType.physical) {
      final physicalPersonViewModel =
          PhysicalPersonViewModel.create(address: AddressController(addressService: _addressService));
      Modular.to.pushNamed('/sign-up', arguments: physicalPersonViewModel);
    }

    if (personType == PersonType.legal) {
      final legalPersonViewModel = LegalPersonViewModel.create(address: AddressController(addressService: _addressService));
      Modular.to.pushNamed('/sign-up', arguments: legalPersonViewModel);
    }
  }

  void getData(SignUpPageViewModel viewModel) {
    print(viewModel);
  }
}
