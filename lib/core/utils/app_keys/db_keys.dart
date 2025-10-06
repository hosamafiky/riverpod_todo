import 'package:flutter/material.dart';
import 'package:riverpod_todo/core/utils/app_keys/task_keys.dart';

@immutable
class DBKeys {
  const DBKeys._();

  static const String dbTable = 'tasks';
  static const String dbName = 'tasks.db';
  static const int dbVersion = 1;

  static const String idColumn = TaskKeys.id;
  static const String titleColumn = TaskKeys.title;
  static const String noteColumn = TaskKeys.note;
  static const String categoryColumn = TaskKeys.category;
  static const String dueDateColumn = TaskKeys.dueDate;
  static const String isCompletedColumn = TaskKeys.isCompleted;
}
