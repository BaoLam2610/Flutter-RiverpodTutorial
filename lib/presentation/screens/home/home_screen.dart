import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:rivepod_tutorial/config/config.dart';
import 'package:rivepod_tutorial/core/core.dart';
import 'package:rivepod_tutorial/domain/models/task.dart';
import 'components/tasks_layout.dart';
import 'package:rivepod_tutorial/providers/task/task_provider.dart';
import '../../../utils/extensions.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const HomeScreen();

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskState = ref.watch(taskProvider);
    Widget? widget;
    if (taskState is Success<List<Task>>) {
      widget = _buildLayoutSuccess(context, taskState.data ?? []);
    }

    if (taskState is Error) {
      widget = Center(
        child: Text(taskState.message),
      );
    }

    return Scaffold(body: widget);
  }

  _buildLayoutSuccess(BuildContext context, List<Task> tasks) {
    return SizedBox(
      height: double.infinity,
      child: Stack(
        children: [
          Container(
            height: context.deviceSize.height / 3,
            width: context.deviceSize.width,
            decoration: BoxDecoration(
                color: context.colorScheme.primary,
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(20))),
          ),
          Column(
            children: [
              const Gap(30),
              Text(
                'Today is good day',
                style: context.textTheme.headlineSmall?.copyWith(
                  color: context.colorScheme.surface,
                  fontSize: 20,
                ),
              ),
              Text(
                'My Todo List',
                style: context.textTheme.headlineSmall?.copyWith(
                  color: context.colorScheme.surface,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              Expanded(
                child: TasksLayout(tasks: tasks),
              ),
              Text(
                'Completed',
                style: context.textTheme.headlineSmall?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Expanded(
                child: TasksLayout(
                  tasks: tasks.where((element) => element.isCompleted).toList(),
                  isCompletedTasks: true,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 18),
                width: context.deviceSize.width,
                child: ElevatedButton(
                  onPressed: () => _onOpenAddNewTask(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.colorScheme.primary,
                    foregroundColor: Colors.white,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    'Add new task',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const Gap(20),
            ],
          ),
        ],
      ),
    );
  }

  void _onOpenAddNewTask(BuildContext context) {
    context.push(RouteLocation.createTask);
  }
}
