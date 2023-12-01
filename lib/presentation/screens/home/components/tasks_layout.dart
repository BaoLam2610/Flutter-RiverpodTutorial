import 'package:flutter/material.dart';
import 'package:rivepod_tutorial/presentation/screens/home/components/task_tile.dart';
import 'package:rivepod_tutorial/presentation/screens/screens.dart';

import '../../../../domain/models/models.dart';

class TasksLayout extends StatelessWidget {
  final List<Task> tasks;
  final bool isCompletedTasks;

  const TasksLayout({
    super.key,
    required this.tasks,
    this.isCompletedTasks = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(20),
      ),
      child: _buildLayout(),
    );
  }

  _buildLayout() {
    final emptyTaskMessage = isCompletedTasks
        ? 'There is no completed task yet'
        : 'There is no task to do!';
    if (tasks.isEmpty) {
      return Center(
        child: Text(emptyTaskMessage),
      );
    } else {
      return ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return TaskTile(
            task: task,
            onOpenTaskDetail: (task) => _openTaskDetail(context, task),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(thickness: 1);
        },
      );
    }
  }

  void _openTaskDetail(BuildContext context, Task task) async {
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return TaskDetailScreen(
          task: task,
        );
      },
    );
  }
}
