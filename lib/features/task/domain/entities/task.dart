// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums/task_category.dart';

class Task extends Equatable {
  final int? id;
  final String title;
  final String note;
  final TaskCategory category;
  final DateTime dueDate;
  final bool isCompleted;

  const Task({this.id, this.title = '', this.note = '', required this.dueDate, this.isCompleted = false, this.category = TaskCategory.others});

  Task copyWith({int? id, String? title, String? note, TaskCategory? category, DateTime? dueDate, bool? isCompleted}) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      category: category ?? this.category,
      dueDate: dueDate ?? this.dueDate,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  String toString() {
    return 'Task(id: $id, title: $title, note: $note, dueDate: $dueDate, isCompleted: $isCompleted, category: $category)';
  }

  @override
  List<Object?> get props => [id, title, note, dueDate, isCompleted, category];
}
