import 'package:flutter/material.dart';
import 'package:to_do_list/app/themes/color_extension.dart';

class TaskDoneWidget extends StatelessWidget {
  const TaskDoneWidget({
    super.key,
    required this.isDone,
    this.radius = 16,
  });

  final bool isDone;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorExtension = theme.extension<ColorExtension>()!;

    return Container(
        height: radius * 2,
        width: radius * 2,
        decoration: BoxDecoration(
          border: Border.all(
            color: isDone
                ? colorExtension.doneBackgroundColor
                : colorExtension.unfocusedBadgeColor,
          ),
          color:
              isDone ? colorExtension.doneBackgroundColor : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: !isDone
            ? null
            : const Center(
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ));
  }
}
