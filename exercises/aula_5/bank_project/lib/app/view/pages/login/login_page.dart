// import 'package:bank_project/app/view/widgets/main_button_widget.dart';
// import 'package:bank_project/app/view/widgets/text_field_widget.dart';
// import 'package:flutter/material.dart';
//
// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final PageController controller = PageController();
//     final theme = Theme.of(context);
//     return Scaffold(
//       backgroundColor: theme.backgroundColor,
//       appBar: AppBar(
//         title: Text(
//           'login',
//           style: theme.textTheme.bodyMedium,
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15.0),
//         child: Column(
//           children: [
//             const Column(
//               children: [
//                 SizedBox(height: 25),
//                 TextFieldWidget(hintText: 'seu-email@email.com'),
//                 SizedBox(height: 15),
//                 TextFieldWidget(hintText: 'sua senha secreta'),
//               ],
//             ),
//             MainButtonWidget(
//               buttonText: 'Entrar',
//               onPressed: () {},
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
