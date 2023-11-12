import 'package:flutter/material.dart';
import 'package:to_do_list/app/core/shared/utils/app_formatters.dart';
import 'package:to_do_list/app/widgets/task_done_widget.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({
    required super.key,
    required this.isDone,
    required this.title,
    required this.description,
    required this.initialDate,
    required this.endDate,
    required this.onTap,
    required this.onDismiss,
  });

  final String title;
  final String description;
  final bool isDone;
  final DateTime initialDate;
  final DateTime endDate;
  final VoidCallback onTap;
  final VoidCallback onDismiss;

  TextDecoration get titleDecoration {
    if (isDone) {
      return TextDecoration.lineThrough;
    } else {
      return TextDecoration.none;
    }
  }

  String get initHour => AppFormatters.formatHourFromDate(initialDate);
  String get endHour => AppFormatters.formatHourFromDate(endDate);
  String get dayMessage {
    final message = AppFormatters.dayMessage(initialDate);
    return message ?? AppFormatters.onlyDay(initialDate);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dismissible(
      key: key!,
      direction: DismissDirection.startToEnd,
      onDismissed: (_) => onDismiss(),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: theme.textTheme.titleLarge?.copyWith(
                          decoration: titleDecoration,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        description,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: TaskDoneWidget(isDone: isDone),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: '$dayMessage   ',
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    TextSpan(text: '$initHour - $endHour'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
