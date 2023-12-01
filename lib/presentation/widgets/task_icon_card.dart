import 'package:flutter/material.dart';

class TaskIconCard extends StatelessWidget {
  final Color color;
  final IconData iconData;
  
  const TaskIconCard({
    super.key,
    required this.color,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        shape: BoxShape.circle,
        border: Border.all(color: color),
      ),
      child: Icon(
        iconData,
        color: color,
      ),
    );
  }
}
