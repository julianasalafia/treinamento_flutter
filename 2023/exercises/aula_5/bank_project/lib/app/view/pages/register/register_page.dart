import 'package:flutter/material.dart';

import '../../../utils/helpers/person_type.dart';
import '../../controllers/register_page_controller.dart';

class RegisterPage extends StatelessWidget {
  final RegisterPageController controller;

  const RegisterPage({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: size.width * 0.1,
                child: Image.asset(
                  'assets/images/pb_logo.png',
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  FilledButton(
                    onPressed: () => controller.navigateToSignUp(PersonType.physical),
                    child: const Text('SOU PESSOA FÍSICA'),
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () => controller.navigateToSignUp(PersonType.legal),
                    child: const Text('SOU EMPRESA'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
