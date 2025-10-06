import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_todo/core/utils/extensions.dart';

import '../../../../core/widgets/task_icon_circle.dart';
import '../../domain/entities/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(this.task, {super.key, this.onChanged});

  final Task task;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    final styles = context.textTheme;
    final titleDecoration = task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none;
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(vertical: 10, horizontal: 16).copyWith(end: 0),
      child: Row(
        children: [
          // Task icon
          TaskIconCircle(task.category, isCompleted: task.isCompleted),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: styles.titleMedium?.copyWith(decoration: titleDecoration, color: task.isCompleted ? Colors.grey : null),
                ),
                const Gap(4),
                Text('Due: ${DateFormat('yyyy-MM-dd, hh:mm a').format(task.dueDate)}', style: styles.bodySmall?.copyWith(color: Colors.grey)),
              ],
            ),
          ),
          const Gap(16),
          Checkbox(value: task.isCompleted, onChanged: task.isCompleted ? null : onChanged),
        ],
      ),
    );
  }
}
