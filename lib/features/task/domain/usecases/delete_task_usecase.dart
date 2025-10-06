import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../presentation/providers/task/repository_provider.dart';
import '../repositories/task_repository.dart';

class DeleteTaskUsecase {
  final TaskRepository repository;

  DeleteTaskUsecase({required this.repository});

  Future<int> call(int id) async {
    return await repository.deleteTask(id);
  }
}

final deleteTaskUsecaseProvider = Provider<DeleteTaskUsecase>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return DeleteTaskUsecase(repository: repository);
});
