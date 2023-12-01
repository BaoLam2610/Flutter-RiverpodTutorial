import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:rivepod_tutorial/config/config.dart';
import 'package:rivepod_tutorial/domain/models/task.dart';
import 'package:rivepod_tutorial/domain/models/task_category.dart';
import 'package:rivepod_tutorial/presentation/screens/home/components/tasks_layout.dart';
import '../../../utils/extensions.dart';

class HomeScreen extends StatelessWidget {
  static HomeScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const HomeScreen();

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
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
                const Expanded(
                  child: TasksLayout(
                    tasks: [
                      Task(
                          title: 'title',
                          note: 'note',
                          time: 'time',
                          date: 'date',
                          isCompleted: false,
                          category: TaskCategory.others),
                      Task(
                          title: 'title',
                          note: 'note',
                          time: 'time',
                          date: 'date',
                          isCompleted: false,
                          category: TaskCategory.others),
                    ],
                  ),
                ),
                Text(
                  'Completed',
                  style: context.textTheme.headlineSmall?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                const Expanded(
                  child: TasksLayout(
                    tasks: [
                      Task(
                          title: 'title',
                          note: 'note',
                          time: 'time',
                          date: 'date',
                          isCompleted: true,
                          category: TaskCategory.work),
                      Task(
                          title: 'title',
                          note:
                              'note\n\n\n\n\n\n\n\n\n\n\n\nsdadasssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nssssssssssssss',
                          time: 'time',
                          date: 'date',
                          isCompleted: true,
                          category: TaskCategory.travel),
                    ],
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
      ),
    );
  }

  void _onOpenAddNewTask(BuildContext context) {
    context.push(RouteLocation.createTask);
  }
}
