// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final int? id;
  final String title;
  final String note;
  final DateTime dueDate;
  final bool isCompleted;

  const Task({this.id, this.title = '', this.note = '', required this.dueDate, this.isCompleted = false});

  @override
  List<Object?> get props => [id, title, note, dueDate, isCompleted];
}
