import 'package:flutter/material.dart';
import 'package:to_do_list/app/themes/color_extension.dart';

class FilterItemWidget extends StatelessWidget {
  const FilterItemWidget({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.title,
    required this.notificationCount,
  });

  final VoidCallback onTap;
  final bool isSelected;
  final String title;
  final int notificationCount;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorExtension>()!;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                color: isSelected
                    ? colors.focusedBadgeColor
                    : colors.unfocusedBadgeColor,
              ),
            ),
            const SizedBox(width: 4),
            if (notificationCount > 0) ...[
              Badge.count(
                count: notificationCount,
                backgroundColor: isSelected
                    ? colors.focusedBadgeColor
                    : colors.unfocusedBadgeColor,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
