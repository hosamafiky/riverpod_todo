import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:riverpod_todo/core/utils/extensions.dart';

import '../../../../core/widgets/display_white_text.dart';
import '../../../task/domain/entities/task.dart';
import '../../../task/presentation/widgets/display_list_of_tasks.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final screenSize = context.screenSize;
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
                  DisplayListOfTasks(
                    List.generate(
                      5,
                      (index) => Task(
                        id: index,
                        title: "Task ${index + 1}",
                        note: "Task details go here",
                        isCompleted: false,
                        dueDate: DateTime.now().add(Duration(days: index)),
                      ),
                    ),
                  ),
                  Gap(20),
                  Text("Completed Tasks", style: context.textTheme.headlineMedium),
                  Gap(20),
                  DisplayListOfTasks.completed(
                    List.generate(
                      5,
                      (index) => Task(
                        id: index,
                        title: "Task ${index + 1}",
                        note: "Completed Task details go here",
                        isCompleted: true,
                        dueDate: DateTime.now().add(Duration(days: index)),
                      ),
                    ),
                  ),
                  Gap(20),
                  ElevatedButton(onPressed: () {}, child: Text("Add Task")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
