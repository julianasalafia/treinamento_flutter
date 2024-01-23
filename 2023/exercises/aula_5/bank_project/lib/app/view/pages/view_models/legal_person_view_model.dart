import 'package:bank_project/app/view/controllers/address_controller.dart';
import 'package:bank_project/app/view/pages/view_models/sign_up_page_view_model.dart';
import 'package:flutter/material.dart';

class LegalPersonViewModel extends SignUpPageViewModel {
  final TextEditingController cnpj;

  const LegalPersonViewModel({
    required this.cnpj,
    required super.name,
    required super.address,
    required super.telephone,
    required super.accounts,
  });

  factory LegalPersonViewModel.create({required AddressController address}) {
    return LegalPersonViewModel(
      cnpj: TextEditingController(),
      name: TextEditingController(),
      address: address,
      telephone: TextEditingController(),
      accounts: [],
    );
  }
}