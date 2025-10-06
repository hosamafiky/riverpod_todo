import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:riverpod_todo/core/utils/extensions.dart';
import 'package:riverpod_todo/features/task/presentation/providers/task/task_provider.dart';

import '../../../../core/widgets/display_white_text.dart';
import '../../../task/domain/entities/task.dart';
import '../../../task/presentation/pages/add_task_screen.dart';
import '../../../task/presentation/widgets/display_list_of_tasks.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    ref.read(tasksProvider.notifier).loadTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final screenSize = context.screenSize;
    final taskState = ref.watch(tasksProvider);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: screenSize.height * 0.3,
                width: screenSize.width,
                color: colors.primary,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DisplayWhiteText("Aug 7, 2024", fontSize: 20, fontWeight: FontWeight.normal),
                    Gap(20),
                    DisplayWhiteText("My Todo List", fontSize: 40),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 170,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.all(20).copyWith(bottom: context.bottomBarHeight + 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DisplayListOfTasks(tasks: taskState.tasks.where((task) => !task.isCompleted).toList()),
                  Gap(20),
                  Text("Completed Tasks", style: context.textTheme.headlineMedium),
                  Gap(20),
                  DisplayListOfTasks.completed(tasks: taskState.tasks.where((task) => task.isCompleted).toList()),
                  Gap(20),
                  ElevatedButton(
                    onPressed: () async {
                      final task = await Navigator.push<Task?>(context, MaterialPageRoute(builder: (context) => const AddTaskScreen()));
                      if (task != null) {
                        // Handle the newly added task
                        ref.read(tasksProvider.notifier).addTask(task);
                      }
                    },
                    child: Text("Add Task"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
