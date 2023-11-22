import 'package:bank_project/app/view/themes/dark/dark_colors.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;

  const TextFieldWidget({
    Key? key,
    required this.hintText,
    this.obscureText = false,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: DarkColors.orange, width: 2),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: DarkColors.orange, width: 2),
        ),
        hintText: hintText,
        hintStyle: theme.textTheme.bodyMedium,
      ),
      obscureText: obscureText,
      style: theme.textTheme.bodyMedium,
    );
  }
}

class TextFieldNumberWidget extends StatelessWidget {
  final TextEditingController controller;

  const TextFieldNumberWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.zero),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(width: 2, color: Colors.white30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: DarkColors.orange, width: 2),
        ),
      ),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      style: const TextStyle(fontFamily: 'Barracuda', fontSize: 16.0),
    );
  }
}
