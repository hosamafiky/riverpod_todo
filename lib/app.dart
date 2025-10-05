import 'package:flutter/material.dart';
import 'package:riverpod_todo/features/home/presentation/pages/home_page.dart';

import 'core/theme/app_theme.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, title: 'Flutter Riverpod Todo', theme: AppTheme.light, home: const HomePage());
  }
}
