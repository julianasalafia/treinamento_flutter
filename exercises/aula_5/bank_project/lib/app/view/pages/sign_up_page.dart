import 'package:bank_project/app/view/pages/register/legal_person/legal_person_sign_up_second_page.dart';
import 'package:bank_project/app/view/pages/register/legal_person/legal_person_sign_up_third_page.dart';
import 'package:bank_project/app/view/pages/register/physical_person/physical_person_sign_up_first_page.dart';
import 'package:bank_project/app/view/pages/register/physical_person/physical_person_sign_up_second_page.dart';
import 'package:bank_project/app/view/pages/register/physical_person/physical_person_sign_up_third_page.dart';
import 'package:flutter/material.dart';

import '../../models/accounts/account_model.dart';
import 'register/legal_person/legal_person_sign_up_first_page.dart';

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

  const LegalPersonSignUpPageViewModel({
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
    final viewModel = signUpPageViewModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('CADASTRO'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: PageView(
          children: [
            if (viewModel is PhysicalPersonSignUpPageViewModel) ...[
              PhysicalPersonSignUpFirstPage(viewModel: viewModel),
              PhysicalPersonSignUpSecondPage(viewModel: viewModel),
              PhysicalPersonSignUpThirdPage(viewModel: viewModel),
            ],
            if (viewModel is LegalPersonSignUpPageViewModel) ...[
              LegalPersonSignUpFirstPage(viewModel: viewModel),
              LegalPersonSignUpSecondPage(viewModel: viewModel),
              LegalPersonSignUpThirdPage(viewModel: viewModel),
            ],
          ],
        ),
      ),
    );
  }
}
