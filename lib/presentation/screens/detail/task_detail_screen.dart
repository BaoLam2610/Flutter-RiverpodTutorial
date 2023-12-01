import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rivepod_tutorial/utils/extensions.dart';

import '../../../domain/models/models.dart';
import '../../widgets/widgets.dart';

class TaskDetailScreen extends StatefulWidget {
  final Task task;
  const TaskDetailScreen({super.key, required this.task});

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.deviceSize.height * 0.6,
      width: context.deviceSize.width,
      padding: const EdgeInsets.only(top: 20, left: 18, right: 18),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TaskIconCard(
              color: widget.task.category.color,
              iconData: widget.task.category.icon,
            ),
            Text(
              widget.task.title,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                height: 1.2,
                decoration:
                    widget.task.isCompleted ? TextDecoration.lineThrough : null,
              ),
            ),
            Text(
              widget.task.time,
              style: context.textTheme.bodyLarge?.copyWith(
                height: 1.2,
                decoration:
                    widget.task.isCompleted ? TextDecoration.lineThrough : null,
              ),
            ),
            Divider(
              thickness: 1,
              color: widget.task.category.color,
            ),
            const Gap(10),
            Text(
              widget.task.note,
              style: context.textTheme.bodyMedium?.copyWith(),
            ),
          ],
        ),
      ),
    );
  }
}
