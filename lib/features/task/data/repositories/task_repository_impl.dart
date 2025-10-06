import 'package:riverpod_todo/features/task/data/models/task_model.dart';
import 'package:riverpod_todo/features/task/domain/entities/task.dart';
import 'package:riverpod_todo/features/task/domain/repositories/task_repository.dart';

import '../datasources/task_local_datasource.dart';

class TaskRepositoryImpl implements TaskRepository {
  @override
  Future<int> deleteTask(int id) async {
    return await TaskLocalDatasource.instance.deleteTask(id);
  }

  @override
  Future<List<Task>> getAllTasks() async {
    return await TaskLocalDatasource.instance.getAllTasks();
  }

  @override
  Future<int> insertTask(Task task) async {
    return await TaskLocalDatasource.instance.insertTask(TaskModel.fromEntity(task));
  }

  @override
  Future<int> updateTask(Task task) async {
    return await TaskLocalDatasource.instance.updateTask(TaskModel.fromEntity(task));
  }
}
