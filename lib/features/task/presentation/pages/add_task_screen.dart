import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:riverpod_todo/core/utils/enums/task_category.dart';
import 'package:riverpod_todo/core/utils/extensions.dart';
import 'package:riverpod_todo/core/widgets/common_text_field.dart';
import 'package:riverpod_todo/core/widgets/task_icon_circle.dart';

import '../../domain/entities/task.dart';
import '../providers/date_time_provider.dart';
import '../providers/task_category_provider.dart';
import '../widgets/select_date_time_widget.dart';

class AddTaskScreen extends ConsumerStatefulWidget {
  const AddTaskScreen({super.key, this.task});

  final Task? task;

  @override
  ConsumerState<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends ConsumerState<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  late final _titleController = TextEditingController(text: widget.task?.title);
  late final _noteController = TextEditingController(text: widget.task?.note);

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  void _onCategorySelected(TaskCategory category) {
    final categoryNotifier = ref.read(taskCategoryProvider.notifier);
    categoryNotifier.state = category;
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.task != null) {
        ref.read(taskCategoryProvider.notifier).state = widget.task!.category;
        ref.read(dateProvider.notifier).state = widget.task!.dueDate;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final styles = context.textTheme;
    final category = ref.watch(taskCategoryProvider);
    return Scaffold(
      appBar: AppBar(title: Text('${widget.task != null ? "Edit" : "Add New"} Task')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CommonTextField(
                  controller: _titleController,
                  keyboardType: TextInputType.text,
                  title: 'Task Title',
                  color: category.color,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                const Gap(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Category: ', style: styles.bodyLarge),
                    const Gap(8),
                    Flexible(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          spacing: 8,
                          children: TaskCategory.values.map((cat) => InkWell(onTap: () => _onCategorySelected(cat), child: TaskIconCircle(cat))).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(16),
                SelectDateTimeWidget(),
                const Gap(16),
                CommonTextField(controller: _noteController, keyboardType: TextInputType.multiline, title: 'Note', color: category.color, maxLines: 5),
                const Gap(16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Save the task
                      final category = ref.read(taskCategoryProvider);
                      final dueDate = ref.read(dateProvider);
                      final newTask = Task(title: _titleController.text, note: _noteController.text, dueDate: dueDate, category: category);
                      // Here you would typically call a method to save the task to your database or state management solution
                      Navigator.pop(
                        context,
                        widget.task != null
                            ? widget.task!.copyWith(title: _titleController.text, note: _noteController.text, dueDate: dueDate, category: category)
                            : newTask,
                      );
                    }
                  },
                  child: Text('${widget.task != null ? "Edit" : "Save"} Task'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
