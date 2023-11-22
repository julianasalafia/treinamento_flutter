import 'package:flutter/material.dart';

import '../../sign_up_page.dart';

class LegalPersonSignUpThirdPage extends StatefulWidget {
  final LegalPersonSignUpPageViewModel viewModel;

  const LegalPersonSignUpThirdPage({
    super.key,
    required this.viewModel,
  });

  @override
  State<LegalPersonSignUpThirdPage> createState() => _LegalPersonSignUpThirdPageState();
}

class _LegalPersonSignUpThirdPageState extends State<LegalPersonSignUpThirdPage> {
  List<String> list = <String>[
    'CONTA CORRENTE',
    'CONTA SALÁRIO',
    'CONTA POUPANÇA',
    'CONTA INVESTIMENTO',
  ];

  @override
  Widget build(BuildContext context) {
    String dropdownValue = list.first;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),
        const Text('Qual conta você gostaria de cadastrar?'),
        const SizedBox(height: 15),
        DropdownButton(
          isExpanded: true,
          iconDisabledColor: Colors.orange,
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              dropdownValue = value!;
            });
          },
        ),
        FilledButton(
          onPressed: () {},
          child: const Text('CADASTRAR'),
        ),
      ],
    );
  }
}
