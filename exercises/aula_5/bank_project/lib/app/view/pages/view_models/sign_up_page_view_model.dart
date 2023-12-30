import 'package:bank_project/app/models/accounts/account_model.dart';
import 'package:bank_project/app/view/controllers/address_controller.dart';
import 'package:flutter/material.dart';

abstract class SignUpPageViewModel {
  final TextEditingController name;
  final AddressController address;
  final TextEditingController telephone;
  final List<AccountModel> accounts;

  const SignUpPageViewModel({
    required this.name,
    required this.address,
    required this.telephone,
    required this.accounts,
  });
}