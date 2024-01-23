import 'package:bank_project/app/view/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

import '../../../themes/dark/dark_colors.dart';
import '../../view_models/physical_person_view_model.dart';

class PhysicalPersonSignUpFirstPage extends StatelessWidget {
  final PhysicalPersonViewModel viewModel;

  const PhysicalPersonSignUpFirstPage({
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
        const Text('Para começar, precisamos saber..'),
        const SizedBox(height: 15),
        TextFieldWidget(hintText: 'seu nome completo', controller: viewModel.name),
        const SizedBox(height: 15),
        TextFieldWidget(hintText: 'celular', controller: viewModel.telephone),
        const SizedBox(height: 15),
        TextFieldWidget(hintText: 'CPF', controller: viewModel.cpf),
        const SizedBox(height: 15),
        TextFieldWidget(hintText: 'Data de nascimento', controller: viewModel.birthAt),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.navigate_next,
                  color: DarkColors.orange,
                  size: 40,
                )),
          ],
        ),
      ],
    );
  }
}
