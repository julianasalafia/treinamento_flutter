import 'package:bank_project/app/utils/helpers/person_type.dart';
import 'package:bank_project/app/view/controllers/welcome_page_controller.dart';
import 'package:bank_project/app/view/themes/dark/dark_colors.dart';
import 'package:bank_project/app/view/widgets/main_button_widget.dart';
import 'package:bank_project/app/view/widgets/shadow_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WelcomePage extends StatelessWidget {
  final WelcomePageController controller;

  WelcomePage({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(),
      body: Center(
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'O BANCO QUE',
                  style: theme.textTheme.bodyMedium?.copyWith(fontSize: 30),
                ),
                Text(
                  'JOGA JUNTO',
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: DarkColors.orange, fontSize: 26),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(
                width: size.width * 0.7,
                child: Image.asset(
                  'assets/images/controle.png',
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  'Bem vindo(a)! Você é...',
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 15),
                MainButtonWidget(
                  buttonText: 'PESSOA FÍSICA',
                  onPressed: () =>
                      controller.navigateToSignUp(PersonType.physical),
                ),
                const SizedBox(height: 10),
                ShadowButtonWidget(
                  buttonText: 'PESSOA JURÍDICA',
                  onPressed: () =>
                      controller.navigateToSignUp(PersonType.legal),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
