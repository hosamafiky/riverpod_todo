import 'package:flutter/material.dart';

@immutable
class TaskKeys {
  const TaskKeys._();

  static const String id = 'id';
  static const String title = 'title';
  static const String note = 'note';
  static const String category = 'category';
  static const String dueDate = 'dueDate';
  static const String isCompleted = 'isCompleted';
}
