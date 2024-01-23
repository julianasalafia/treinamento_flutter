import 'package:bank_project/app/view/widgets/address_widget.dart';
import 'package:flutter/material.dart';

import '../../../themes/dark/dark_colors.dart';
import '../../view_models/legal_person_view_model.dart';

class LegalPersonSignUpSecondPage extends StatelessWidget {
  final LegalPersonViewModel viewModel;

  const LegalPersonSignUpSecondPage({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AddressWidget(address: viewModel.address),
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
