import 'package:bank_project/app/view/controllers/welcome_page_controller.dart';
import 'package:bank_project/app/view/themes/dark/dark_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WelcomePage extends StatelessWidget {
  final WelcomePageController controller;

  const WelcomePage({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Center(
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
                    style: theme.textTheme.bodyMedium?.copyWith(color: DarkColors.orange, fontSize: 26),
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
                  Text('Bem-vindo(a)!', style: theme.textTheme.bodyMedium),
                  const SizedBox(height: 15),
                  FilledButton(
                    onPressed: () => Modular.to.pushNamed('/login'),
                    child: const Text('LOGIN'),
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () => Modular.to.pushNamed('/register'),
                    child: const Text('CADASTRO'),
                    // controller.navigateToSignUp(PersonType.physical),
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
