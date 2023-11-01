import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.label,
    this.hintText,
    this.validator,
    this.maxLines = 1,
    this.readOnly = false,
    this.keyboardType,
    this.onTap,
  });

  final TextEditingController controller;
  final String label;
  final String? hintText;
  final String? Function(String? value)? validator;
  final int maxLines;
  final bool readOnly;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.labelLarge,
        ),
        const SizedBox(height: 8),
        TextFormField(
          onTap: onTap,
          controller: controller,
          readOnly: readOnly,
          validator: validator,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
