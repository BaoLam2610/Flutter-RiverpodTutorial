import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:rivepod_tutorial/config/routes/route_location.dart';
import 'package:rivepod_tutorial/core/core.dart';
import 'package:rivepod_tutorial/providers/providers.dart';
import 'package:rivepod_tutorial/providers/task/task_provider.dart';
import 'package:rivepod_tutorial/utils/app_alerts.dart';
import 'package:rivepod_tutorial/utils/utils.dart';

import '../../../domain/models/models.dart';
import '../../widgets/widgets.dart';
import 'components/task_category_tile.dart';

class CreateTaskScreen extends ConsumerStatefulWidget {
  static CreateTaskScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const CreateTaskScreen();

  const CreateTaskScreen({super.key});

  @override
  ConsumerState<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<CreateTaskScreen> {
  final titleTextController = TextEditingController();
  final noteTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.invalidate(timeProvider);
    ref.invalidate(dateProvider);
    ref.invalidate(categoryProvider);

    ref.listen(taskProvider, (previous, next) {
      if (next is Error) {
        AppAlerts.showAlertDialog(context,title: next.message);
      }
      if (next is Success) {
        AppAlerts.showSnackBar(context, 'Task created successfully!');
        context.go(RouteLocation.home);
      }
    });

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() => AppBar(
        backgroundColor: context.colorScheme.primary,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Add new task',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );

  _buildBody() => SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LabelTextField(
                controller: titleTextController,
                label: 'Task title',
                hintText: 'Enter title',
              ),
              const Gap(18),
              Row(
                children: [
                  Text(
                    'Category',
                    style: context.textTheme.titleLarge,
                  ),
                  const Gap(6),
                  Expanded(
                    child: SizedBox(
                      height: 80,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: TaskCategory.values.length,
                        itemBuilder: (context, index) {
                          final category = TaskCategory.values[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: TaskCategoryTile(category: category),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
              const Gap(18),
              const Row(
                children: [
                  Expanded(child: SelectDateField()),
                  Gap(12),
                  Expanded(child: SelectTimeField()),
                ],
              ),
              const Gap(18),
              LabelTextField(
                controller: noteTextController,
                label: 'Note',
                hintText: 'Enter note',
                maxLines: 5,
              ),
              const Gap(48),
              _buildSubmitButton(context),
            ],
          ),
        ),
      );

  _buildSubmitButton(BuildContext context) => ElevatedButton(
        onPressed: _onUpsertTask,
        style: ElevatedButton.styleFrom(
          backgroundColor: context.colorScheme.primary,
          foregroundColor: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Save',
            style: context.textTheme.titleLarge?.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      );

  void _onUpsertTask() {
    final time = ref.read(timeProvider);
    final date = ref.read(dateProvider);
    final category = ref.read(categoryProvider);

    final task = Task(
      title: titleTextController.text,
      note: noteTextController.text,
      time: Helpers.timeToString(time),
      date: Helpers.dateToString(date),
      isCompleted: false,
      category: category,
    );

    ref.read(taskProvider.notifier).createTask(task);
  }
}
