import 'package:bank_project/app/view/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          children: [
            const Column(
              children: [
                SizedBox(height: 25),
                TextFieldWidget(
                  hintText: 'seu-email@email.com',
                  controller: null,
                ),
                SizedBox(height: 15),
                TextFieldWidget(
                  hintText: 'sua senha secreta',
                  controller: null,
                ),
              ],
            ),
            FilledButton(
              onPressed: () {},
              child: const Text('ENTRAR'),
            ),
          ],
        ),
      ),
    );
  }
}
