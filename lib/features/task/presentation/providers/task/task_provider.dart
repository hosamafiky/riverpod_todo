import 'package:flutter_riverpod/legacy.dart';

import '../../../domain/usecases/delete_task_usecase.dart';
import '../../../domain/usecases/get_all_tasks_usecase.dart';
import '../../../domain/usecases/insert_task_usecase.dart';
import '../../../domain/usecases/update_task_usecase.dart';
import 'task_notifier.dart';
import 'task_state.dart';

final tasksProvider = StateNotifierProvider<TasksNotifier, TaskState>((ref) {
  final updateTaskUsecase = ref.watch(updateTaskUsecaseProvider);
  final insertTaskUsecase = ref.watch(insertTaskUsecaseProvider);
  final getAllTasksUsecase = ref.watch(getAllTasksUsecaseProvider);
  final deleteTaskUsecase = ref.watch(deleteTaskUsecaseProvider);

  return TasksNotifier(
    updateTaskUsecase: updateTaskUsecase,
    insertTaskUsecase: insertTaskUsecase,
    getAllTasksUsecase: getAllTasksUsecase,
    deleteTaskUsecase: deleteTaskUsecase,
  );
});
