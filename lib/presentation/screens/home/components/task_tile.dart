import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rivepod_tutorial/presentation/widgets/task_icon_card.dart';
import 'package:rivepod_tutorial/utils/extensions.dart';

import '../../../../domain/models/models.dart';

class TaskTile extends StatefulWidget {
  final Function()? onDeleteTask;
  final Function(Task task)? onOpenTaskDetail;
  final Task task;

  const TaskTile({
    super.key,
    required this.task,
    this.onDeleteTask,
    this.onOpenTaskDetail,
  });

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: _onDeleteTask,
      onTap: _onOpenTaskDetail,
      child: Row(
        children: [
          TaskIconCard(
            color: widget.task.category.color,
            iconData: widget.task.category.icon,
          ),
          const Gap(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.task.title,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                    decoration: widget.task.isCompleted
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
                Text(
                  widget.task.time,
                  style: context.textTheme.bodyMedium?.copyWith(
                    height: 1.2,
                    decoration: widget.task.isCompleted
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
              ],
            ),
          ),
          Checkbox(
            value: widget.task.isCompleted,
            onChanged: (value) {},
          )
        ],
      ),
    );
  }

  void _onDeleteTask() {
    if (widget.onDeleteTask != null) {
      widget.onDeleteTask!();
    }
  }

  void _onOpenTaskDetail() {
    if (widget.onOpenTaskDetail != null) {
      widget.onOpenTaskDetail!(widget.task);
    }
  }
}
