import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/widgets/common_text_field.dart';
import '../providers/date_time_provider.dart';
import '../providers/task_category_provider.dart';

class SelectDateTimeWidget extends ConsumerWidget {
  const SelectDateTimeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(dateProvider);
    final category = ref.watch(taskCategoryProvider);
    return Row(
      spacing: 16,
      children: [
        Expanded(
          child: CommonTextField(
            title: 'Date',
            controller: TextEditingController(text: DateFormat('y MMM d').format(selectedDate)),
            suffixIcon: const Icon(Icons.calendar_month),
            color: category.color,
            readOnly: true,
            onTap: () async {
              final now = DateTime.now();
              final selectedDate = await showDatePicker(context: context, initialDate: now, firstDate: now, lastDate: DateTime(now.year + 5));
              if (selectedDate != null) {
                final dueDate = ref.read(dateProvider);
                ref.read(dateProvider.notifier).state = DateTime(selectedDate.year, selectedDate.month, selectedDate.day, dueDate.hour, dueDate.minute);
              }
            },
          ),
        ),

        Expanded(
          child: CommonTextField(
            controller: TextEditingController(text: DateFormat('hh:mm a').format(selectedDate)),
            title: 'Time',
            readOnly: true,
            color: category.color,
            suffixIcon: const Icon(Icons.access_time),
            onTap: () async {
              final dueDate = ref.read(dateProvider);
              final selectedDate = await showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(dueDate));
              if (selectedDate != null) {
                ref.read(dateProvider.notifier).state = DateTime(dueDate.year, dueDate.month, dueDate.day, selectedDate.hour, selectedDate.minute);
              }
            },
          ),
        ),
      ],
    );
  }
}
