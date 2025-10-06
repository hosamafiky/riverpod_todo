import 'package:flutter/material.dart';
import 'package:riverpod_todo/core/utils/enums/task_category.dart';

class TaskIconCircle extends StatelessWidget {
  const TaskIconCircle(this.category, {super.key, this.isCompleted = false});

  final TaskCategory category;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    final iconOpacity = isCompleted ? 0.3 : 1.0;
    final bgOpacity = isCompleted ? 0.1 : 0.3;
    return Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: category.color.withValues(alpha: bgOpacity),
        shape: BoxShape.circle,
        border: Border.all(color: category.color.withValues(alpha: iconOpacity), width: 2),
      ),
      child: Icon(category.icon, color: category.color.withValues(alpha: iconOpacity)),
    );
  }
}
