import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../presentation/providers/task/repository_provider.dart';
import '../entities/task.dart';
import '../repositories/task_repository.dart';

class GetAllTasksUsecase {
  final TaskRepository repository;

  GetAllTasksUsecase({required this.repository});

  Future<List<Task>> call() async {
    return await repository.getAllTasks();
  }
}

final getAllTasksUsecaseProvider = Provider<GetAllTasksUsecase>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return GetAllTasksUsecase(repository: repository);
});
