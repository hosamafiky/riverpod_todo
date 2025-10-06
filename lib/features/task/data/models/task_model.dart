import 'package:riverpod_todo/features/task/domain/entities/task.dart';

import '../../../../core/utils/app_keys/task_keys.dart';
import '../../../../core/utils/enums/task_category.dart';

class TaskModel extends Task {
  const TaskModel({super.id, super.title, super.note, required super.dueDate, super.isCompleted = false, super.category});

  factory TaskModel.fromEntity(Task task) {
    return TaskModel(id: task.id, title: task.title, note: task.note, dueDate: task.dueDate, isCompleted: task.isCompleted, category: task.category);
  }

  Map<String, dynamic> toMap() {
    return {
      TaskKeys.id: id,
      TaskKeys.title: title,
      TaskKeys.note: note,
      TaskKeys.category: category.name,
      TaskKeys.dueDate: dueDate.toIso8601String(),
      TaskKeys.isCompleted: isCompleted ? 1 : 0,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map[TaskKeys.id] != null ? map[TaskKeys.id] as int : null,
      title: map[TaskKeys.title] as String,
      note: map[TaskKeys.note] as String,
      category: TaskCategory.values.byName(map[TaskKeys.category] as String),
      dueDate: DateTime.parse(map[TaskKeys.dueDate] as String),
      isCompleted: (map[TaskKeys.isCompleted] as int) == 1,
    );
  }
}
