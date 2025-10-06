import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/utils/enums/task_category.dart';

final taskCategoryProvider = StateProvider.autoDispose<TaskCategory>((ref) => TaskCategory.others);
