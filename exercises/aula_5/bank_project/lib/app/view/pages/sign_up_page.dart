import 'package:bank_project/app/view/pages/register/legal_person/legal_person_sign_up_second_page.dart';
import 'package:bank_project/app/view/pages/register/legal_person/legal_person_sign_up_third_page.dart';
import 'package:bank_project/app/view/pages/register/physical_person/physical_person_sign_up_first_page.dart';
import 'package:bank_project/app/view/pages/register/physical_person/physical_person_sign_up_second_page.dart';
import 'package:bank_project/app/view/pages/register/physical_person/physical_person_sign_up_third_page.dart';
import 'package:bank_project/app/view/pages/view_models/legal_person_view_model.dart';
import 'package:bank_project/app/view/pages/view_models/physical_person_view_model.dart';
import 'package:bank_project/app/view/pages/view_models/sign_up_page_view_model.dart';
import 'package:flutter/material.dart';

import 'register/legal_person/legal_person_sign_up_first_page.dart';


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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('CADASTRO'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: PageView(
          children: [
            if (viewModel is PhysicalPersonViewModel) ...[
              PhysicalPersonSignUpFirstPage(viewModel: viewModel),
              PhysicalPersonSignUpSecondPage(viewModel: viewModel),
              PhysicalPersonSignUpThirdPage(viewModel: viewModel),
            ],
            if (viewModel is LegalPersonViewModel) ...[
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
