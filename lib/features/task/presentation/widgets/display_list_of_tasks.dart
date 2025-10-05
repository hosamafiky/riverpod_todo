import 'package:flutter/material.dart';
import 'package:riverpod_todo/core/utils/extensions.dart';
import 'package:riverpod_todo/core/widgets/common_container.dart';

import '../../domain/entities/task.dart';

class DisplayListOfTasks extends StatelessWidget {
  const DisplayListOfTasks(this.tasks, {super.key}) : _isCompleted = false;
  const DisplayListOfTasks.completed(this.tasks, {super.key}) : _isCompleted = true;

  final List<Task> tasks;
  final bool _isCompleted;

  @override
  Widget build(BuildContext context) {
    final screenSize = context.screenSize;
    final height = _isCompleted ? screenSize.height * 0.25 : screenSize.height * 0.3;
    return CommonContainer(
      height: height,
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(title: Text(task.title), subtitle: Text(task.note), trailing: Icon(Icons.check_circle_outline));
        },
        itemCount: tasks.length,
        shrinkWrap: true,
      ),
    );
  }
}
