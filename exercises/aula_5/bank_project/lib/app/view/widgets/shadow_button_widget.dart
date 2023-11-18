import 'package:bank_project/app/view/themes/dark/dark_colors.dart';
import 'package:flutter/material.dart';

class ShadowButtonWidget extends StatelessWidget {
  const ShadowButtonWidget({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  final String buttonText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 45.0,
      width: size.width - 30,
      child: TextButton(
        onPressed: onPressed,
        style: buildButtonStyle(),
        child: Text(
          buttonText,
          style: theme.textTheme.bodySmall?.copyWith(color: DarkColors.orange),
        ),
      ),
    );
  }

  ButtonStyle buildButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      side: MaterialStateProperty.all(
        const BorderSide(
          width: 2,
          color: DarkColors.orange,
        ),
      ),
    );
  }
}
