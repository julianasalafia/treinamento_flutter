import 'package:bank_project/app/view/controllers/address_controller.dart';
import 'package:bank_project/app/view/pages/view_models/sign_up_page_view_model.dart';
import 'package:flutter/material.dart';

class PhysicalPersonViewModel extends SignUpPageViewModel {
  final TextEditingController cpf;
  final TextEditingController birthAt;

  PhysicalPersonViewModel({
    required this.cpf,
    required this.birthAt,
    required super.name,
    required super.address,
    required super.telephone,
    required super.accounts,
  });

  factory PhysicalPersonViewModel.create({required AddressController address}) {
    return PhysicalPersonViewModel(
      cpf: TextEditingController(),
      birthAt: TextEditingController(),
      name: TextEditingController(),
      address: address,
      telephone: TextEditingController(),
      accounts: [],
    );
  }
}