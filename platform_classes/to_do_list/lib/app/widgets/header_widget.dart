import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onAddTap;

  const HeaderWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: theme.textTheme.titleSmall,
            ),
          ],
        ),
        ElevatedButton.icon(
          onPressed: onAddTap,
          label: const Text('Nova tarefa'),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
