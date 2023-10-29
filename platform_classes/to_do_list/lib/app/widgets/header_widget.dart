import 'package:flutter/material.dart';
import 'package:to_do_list/app/themes/light/light_colors.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

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
              'Today\'s task',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Date',
              style: theme.textTheme.titleSmall,
            ),
          ],
        ),
        ElevatedButton.icon(
          onPressed: () {},
          label: const Text('Nova tarefa'),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
