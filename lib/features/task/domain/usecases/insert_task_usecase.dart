import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../presentation/providers/task/repository_provider.dart';
import '../entities/task.dart';
import '../repositories/task_repository.dart';

class InsertTaskUsecase {
  final TaskRepository repository;

  InsertTaskUsecase({required this.repository});

  Future<int> call(Task task) async {
    return await repository.insertTask(task);
  }
}

final insertTaskUsecaseProvider = Provider<InsertTaskUsecase>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return InsertTaskUsecase(repository: repository);
});
