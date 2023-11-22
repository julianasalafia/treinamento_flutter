import 'package:flutter/material.dart';

import '../../sign_up_page.dart';

class PhysicalPersonSignUpThirdPage extends StatefulWidget {
  final PhysicalPersonSignUpPageViewModel viewModel;

  const PhysicalPersonSignUpThirdPage({
    super.key,
    required this.viewModel,
  });

  @override
  State<PhysicalPersonSignUpThirdPage> createState() => _PhysicalPersonSignUpThirdPageState();
}

class _PhysicalPersonSignUpThirdPageState extends State<PhysicalPersonSignUpThirdPage> {
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
