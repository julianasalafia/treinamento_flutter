import 'package:bank_project/app/view/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

import '../../sign_up_page.dart';
import '../../../themes/dark/dark_colors.dart';

class PhysicalPersonSignUpSecondPage extends StatelessWidget {
  final PhysicalPersonSignUpPageViewModel viewModel;

  const PhysicalPersonSignUpSecondPage({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),
        TextFieldWidget(hintText: 'rua', controller: viewModel.address),
        const SizedBox(height: 15),
        TextFieldWidget(hintText: 'número', controller: viewModel.address),
        const SizedBox(height: 15),
        TextFieldWidget(hintText: 'bairro', controller: viewModel.address),
        const SizedBox(height: 15),
        TextFieldWidget(hintText: 'cep', controller: viewModel.address),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.navigate_next,
                color: DarkColors.orange,
                size: 40,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
