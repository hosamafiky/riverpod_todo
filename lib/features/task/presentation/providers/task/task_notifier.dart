import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_todo/features/task/domain/usecases/delete_task_usecase.dart';
import 'package:riverpod_todo/features/task/domain/usecases/insert_task_usecase.dart';
import 'package:riverpod_todo/features/task/domain/usecases/update_task_usecase.dart';
import 'package:riverpod_todo/features/task/presentation/providers/task/task_state.dart';

import '../../../domain/entities/task.dart';
import '../../../domain/usecases/get_all_tasks_usecase.dart';

class TasksNotifier extends StateNotifier<TaskState> {
  final GetAllTasksUsecase getAllTasksUsecase;
  final InsertTaskUsecase insertTaskUsecase;
  final UpdateTaskUsecase updateTaskUsecase;
  final DeleteTaskUsecase deleteTaskUsecase;

  TasksNotifier({required this.getAllTasksUsecase, required this.insertTaskUsecase, required this.updateTaskUsecase, required this.deleteTaskUsecase})
    : super(TaskState());

  Future<void> loadTasks() async {
    final tasks = await getAllTasksUsecase();
    state = state.copyWith(tasks: tasks);
  }

  Future<void> addTask(Task task) async {
    await insertTaskUsecase(task);
    await loadTasks();
  }

  Future<void> updateTask(Task task) async {
    await updateTaskUsecase(task);
    await loadTasks();
  }

  Future<void> deleteTask(int id) async {
    await deleteTaskUsecase(id);
    await loadTasks();
  }
}
