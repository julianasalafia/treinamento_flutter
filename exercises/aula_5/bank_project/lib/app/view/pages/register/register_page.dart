import 'package:bank_project/app/view/themes/dark/dark_colors.dart';
import 'package:bank_project/app/view/widgets/main_button_widget.dart';
import 'package:bank_project/app/view/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        title: Text(
          'cadastro',
          style: theme.textTheme.bodyMedium,
        ),
      ),
      body: Column(
        children: [
          // quero uma linha aqui com os numeros 1 2 3, passos
          Expanded(
            child: PageView(
              controller: controller,
              children: [
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 15.0),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       const SizedBox(height: 25),
                //       const Text('Para começar, precisamos saber..'),
                //       const SizedBox(height: 15),
                //       const TextFieldWidget(hintText: 'seu nome completo'),
                //       const SizedBox(height: 15),
                //       const TextFieldWidget(hintText: 'celular'),
                //       const SizedBox(height: 15),
                //       const TextFieldWidget(hintText: 'CPF'),
                //       const SizedBox(height: 15),
                //       const TextFieldWidget(hintText: 'Data de nascimento'),
                //       const SizedBox(height: 15),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           IconButton(
                //               onPressed: () {},
                //               icon: Icon(
                //                 Icons.navigate_next,
                //                 color: DarkColors.orange,
                //                 size: 40,
                //               )),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 15.0),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       const SizedBox(height: 25),
                //       const Text('E também...'),
                //       const SizedBox(height: 15),
                //       const TextFieldWidget(hintText: 'sua rua'),
                //       const SizedBox(height: 15),
                //       const TextFieldWidget(hintText: 'número'),
                //       const SizedBox(height: 15),
                //       const TextFieldWidget(hintText: 'bairro'),
                //       const SizedBox(height: 15),
                //       const TextFieldWidget(hintText: 'CEP'),
                //       const SizedBox(height: 15),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           IconButton(
                //               onPressed: () {},
                //               icon: const Icon(
                //                 Icons.navigate_next,
                //                 color: DarkColors.orange,
                //                 size: 40,
                //               )),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       const SizedBox(height: 25),
                //       const Text('Qual conta você gostaria de cadastrar?'),
                //       const Text('menu aqui'),
                //       MainButtonWidget(
                //           buttonText: 'CADASTRAR', onPressed: () {}),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
