import 'package:bank_project/app/view/widgets/physical_person_sign_up_page_view_widget.dart';
import 'package:flutter/material.dart';

import '../../models/accounts/account_model.dart';
import '../widgets/legal_person_sign_up_page_view_widget.dart';

abstract class SignUpPageViewModel {
  final TextEditingController name;
  final TextEditingController address;
  final TextEditingController telephone;
  final List<AccountModel> accounts;

  const SignUpPageViewModel({
    required this.name,
    required this.address,
    required this.telephone,
    required this.accounts,
  });
}

class PhysicalPersonSignUpPageViewModel extends SignUpPageViewModel {
  final TextEditingController cpf;
  final TextEditingController birthAt;

  PhysicalPersonSignUpPageViewModel({
    required this.cpf,
    required this.birthAt,
    required super.name,
    required super.address,
    required super.telephone,
    required super.accounts,
  });

  factory PhysicalPersonSignUpPageViewModel.create() {
    return PhysicalPersonSignUpPageViewModel(
      cpf: TextEditingController(),
      birthAt: TextEditingController(),
      name: TextEditingController(),
      address: TextEditingController(),
      telephone: TextEditingController(),
      accounts: [],
    );
  }
}

class LegalPersonSignUpPageViewModel extends SignUpPageViewModel {
  final TextEditingController cnpj;

  LegalPersonSignUpPageViewModel({
    required this.cnpj,
    required super.name,
    required super.address,
    required super.telephone,
    required super.accounts,
  });

  factory LegalPersonSignUpPageViewModel.create() {
    return LegalPersonSignUpPageViewModel(
      cnpj: TextEditingController(),
      name: TextEditingController(),
      address: TextEditingController(),
      telephone: TextEditingController(),
      accounts: [],
    );
  }
}

class SignUpPage extends StatelessWidget {
  final SignUpPageViewModel signUpPageViewModel;

  const SignUpPage({
    super.key,
    required this.signUpPageViewModel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Center(
        child: Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: AppBar(
            title: Text('Cadastro'),
          ),
          body: signUpPageViewModel is PhysicalPersonSignUpPageViewModel
              ? PhysicalPersonSignUpPageViewWidget(
                  viewModel:
                      signUpPageViewModel as PhysicalPersonSignUpPageViewModel)
              : LegalPersonSignUpPageViewWidget(
                  viewModel:
                      signUpPageViewModel as LegalPersonSignUpPageViewModel),
        ),
      ),
    );
  }
}
