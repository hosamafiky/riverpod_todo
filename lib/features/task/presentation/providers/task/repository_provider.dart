import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/repositories/task_repository_impl.dart';
import '../../../domain/repositories/task_repository.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  // Replace with your actual repository implementation
  return TaskRepositoryImpl();
});
