import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_todo/core/utils/extensions.dart';
import 'package:riverpod_todo/core/widgets/task_icon_circle.dart';

import '../../domain/entities/task.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails(this.task, {super.key});

  final Task task;

  @override
  Widget build(BuildContext context) {
    final styles = context.textTheme;
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          TaskIconCircle(task.category, isCompleted: task.isCompleted),
          const Gap(16),
          Text(task.title, style: styles.headlineMedium),
          const Gap(8),
          Visibility(
            visible: !task.isCompleted,
            child: Text(
              'Task has to be completed by:\n${DateFormat('y MMM d, hh:mm a').format(task.dueDate)}',
              textAlign: TextAlign.center,
              style: styles.bodyMedium?.copyWith(color: Colors.grey),
            ),
          ),
          Divider(color: task.category.color, thickness: 1.5, height: 32),
          Visibility(
            visible: task.note.isNotEmpty,
            replacement: Text(
              'No additional notes.',
              style: styles.bodyMedium?.copyWith(fontStyle: FontStyle.italic, color: Colors.grey),
            ),
            child: Text(task.note, style: styles.bodyLarge),
          ),
        ],
      ),
    );
  }
}
