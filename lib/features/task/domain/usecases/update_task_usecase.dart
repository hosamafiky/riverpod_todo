import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../presentation/providers/task/repository_provider.dart';
import '../entities/task.dart';
import '../repositories/task_repository.dart';

class UpdateTaskUsecase {
  final TaskRepository repository;

  UpdateTaskUsecase({required this.repository});

  Future<int> call(Task task) async {
    return await repository.updateTask(task);
  }
}

final updateTaskUsecaseProvider = Provider<UpdateTaskUsecase>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return UpdateTaskUsecase(repository: repository);
});
