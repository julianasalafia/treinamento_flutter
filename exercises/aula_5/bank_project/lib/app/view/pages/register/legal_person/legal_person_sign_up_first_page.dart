import 'package:bank_project/app/view/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

import '../../../themes/dark/dark_colors.dart';
import '../../view_models/legal_person_view_model.dart';

class LegalPersonSignUpFirstPage extends StatelessWidget {
  final LegalPersonViewModel viewModel;

  const LegalPersonSignUpFirstPage({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        const Text('Para começar, precisamos saber..'),
        const SizedBox(height: 15),
        TextFieldWidget(hintText: 'nome da empresa', controller: viewModel.name),
        const SizedBox(height: 15),
        TextFieldWidget(hintText: 'contato', controller: viewModel.telephone),
        const SizedBox(height: 15),
        TextFieldWidget(hintText: 'CNPJ', controller: viewModel.cnpj),
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
