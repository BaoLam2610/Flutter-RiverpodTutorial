import 'package:flutter/material.dart';

enum TaskCategory {
  education(
    type: 0,
    icon: Icons.school_outlined,
    color: Colors.blueGrey,
  ),
  health(
    type: 1,
    icon: Icons.favorite_outline_rounded,
    color: Colors.orange,
  ),
  home(
    type: 2,
    icon: Icons.home_outlined,
    color: Colors.green,
  ),
  personal(
    type: 3,
    icon: Icons.person_outline_outlined,
    color: Colors.lightBlue,
  ),
  shopping(
    type: 4,
    icon: Icons.shopping_bag_outlined,
    color: Colors.pink,
  ),
  social(
    type: 5,
    icon: Icons.people_outline,
    color: Colors.brown,
  ),
  travel(
    type: 6,
    icon: Icons.flight_outlined,
    color: Colors.deepOrange,
  ),
  work(
    type: 7,
    icon: Icons.work_outline,
    color: Colors.amber,
  ),
  others(
    type: 8,
    icon: Icons.calendar_month_outlined,
    color: Colors.purple,
  );

  final int type;
  final IconData icon;
  final Color color;
  const TaskCategory({
    required this.type,
    required this.icon,
    required this.color,
  });
}
