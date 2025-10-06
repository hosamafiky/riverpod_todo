import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo/core/utils/extensions.dart';
import 'package:riverpod_todo/core/widgets/common_container.dart';
import 'package:riverpod_todo/features/task/presentation/widgets/task_details.dart';
import 'package:riverpod_todo/features/task/presentation/widgets/task_tile.dart';

import '../../domain/entities/task.dart';
import '../pages/add_task_screen.dart';
import '../providers/task/task_provider.dart';

class DisplayListOfTasks extends ConsumerWidget {
  const DisplayListOfTasks({super.key, required this.tasks}) : _isCompleted = false;
  const DisplayListOfTasks.completed({super.key, required this.tasks}) : _isCompleted = true;

  final List<Task> tasks;
  final bool _isCompleted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = context.screenSize;
    final height = _isCompleted ? screenSize.height * 0.25 : screenSize.height * 0.3;
    final emptyMessage = _isCompleted ? 'No completed tasks yet!' : 'No tasks yet!';
    return CommonContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(child: Text(emptyMessage, style: context.textTheme.headlineSmall))
          : ListView.separated(
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => InkWell(
                onDoubleTap: () async {
                  final taskToUpdate = await Navigator.push<Task?>(context, MaterialPageRoute(builder: (context) => AddTaskScreen(task: tasks[index])));
                  if (taskToUpdate != null) ref.read(tasksProvider.notifier).updateTask(taskToUpdate);
                },
                onLongPress: () {
                  ref.read(tasksProvider.notifier).deleteTask(tasks[index].id!);
                },
                onTap: () async {
                  // Show task details or edit task
                  await showModalBottomSheet(context: context, builder: (context) => TaskDetails(tasks[index]));
                },
                child: TaskTile(
                  tasks[index],
                  onChanged: (value) {
                    if (tasks[index].isCompleted) return;
                    ref.read(tasksProvider.notifier).updateTask(tasks[index].copyWith(isCompleted: value ?? false));
                  },
                ),
              ),
              separatorBuilder: (context, index) => Divider(thickness: 1.5),
              itemCount: tasks.length,
              shrinkWrap: true,
            ),
    );
  }
}
