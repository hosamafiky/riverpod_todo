import 'package:flutter/material.dart';

enum TaskCategory {
  education(color: Colors.blue, icon: Icons.school),
  health(color: Colors.orange, icon: Icons.health_and_safety),
  home(color: Colors.green, icon: Icons.home),
  personal(color: Colors.lightBlue, icon: Icons.person),
  work(color: Colors.amber, icon: Icons.work),
  shopping(color: Colors.pink, icon: Icons.shopping_cart),
  social(color: Colors.brown, icon: Icons.people),
  travel(color: Colors.deepOrange, icon: Icons.flight),
  others;

  final IconData icon;
  final Color color;

  const TaskCategory({this.icon = Icons.category, this.color = Colors.grey});
}
