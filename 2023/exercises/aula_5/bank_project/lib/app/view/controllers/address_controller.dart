import 'package:bank_project/app/services/address_service.dart';
import 'package:flutter/cupertino.dart';

class AddressController extends ChangeNotifier {
  final AddressService _addressService;
  final TextEditingController cep = TextEditingController();
  final TextEditingController street = TextEditingController();
  final TextEditingController neighbourhood = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController number = TextEditingController();
  final TextEditingController complement = TextEditingController();
  bool isLoading = false;

  AddressController({required AddressService addressService}) : _addressService = addressService;

  bool isCepValid(String cep) {
    if (cep.length == 8) {
      return true;
    }
    return false;
  }

  Future<void> getAddress() async {
    if (isCepValid(cep.text) == false) {
      return;
    }

    if (isLoading) {
      return;
    }

    isLoading = true;
    notifyListeners();

    try {
      final address = await _addressService.getAddress(cep.text);
      street.text = address.street;
      neighbourhood.text = address.neighbourhood;
      city.text = address.city;
      state.text = address.state;
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}