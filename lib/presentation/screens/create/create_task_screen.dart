import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:rivepod_tutorial/utils/utils.dart';

import '../../../domain/models/models.dart';
import '../../widgets/widgets.dart';
import 'components/task_category_tile.dart';

class CreateTaskScreen extends StatelessWidget {
  static CreateTaskScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const CreateTaskScreen();

  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  _buildAppBar(BuildContext context) => AppBar(
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

  _buildBody(BuildContext context) => SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const LabelTextField(
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
              const LabelTextField(
                label: 'Note',
                hintText: 'Enter note',
                maxLines: 5,
              ),
              const Gap(48),
              ElevatedButton(
                onPressed: () {},
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
              )
            ],
          ),
        ),
      );
}
