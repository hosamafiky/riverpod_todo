import '../entities/task.dart';

abstract class TaskRepository {
  Future<int> insertTask(Task task);
  Future<List<Task>> getAllTasks();
  Future<int> deleteTask(int id);
  Future<int> updateTask(Task task);
}
