import 'package:bank_project/app/view/themes/dark/dark_colors.dart';
import 'package:flutter/material.dart';

class MainButtonWidget extends StatelessWidget {
  const MainButtonWidget({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  final String buttonText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: 45.0,
      width: size.width - 30,
      child: Material(
        color: DarkColors.orange,
        elevation: 0,
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: theme.textTheme.bodySmall?.copyWith(color: DarkColors.grey),
          ),
        ),
      ),
    );
  }
}
