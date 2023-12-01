import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rivepod_tutorial/domain/models/task_category.dart';
import 'package:rivepod_tutorial/providers/category_provider.dart';

import '../../../widgets/widgets.dart';

class TaskCategoryTile extends ConsumerStatefulWidget {
  final TaskCategory category;
  const TaskCategoryTile({
    super.key,
    required this.category,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TaskCategoryTileState();
}

class _TaskCategoryTileState extends ConsumerState<TaskCategoryTile> {
  @override
  Widget build(BuildContext context) {
    final currentCategory = ref.watch(categoryProvider);
    final isSameCategory = currentCategory == widget.category;
    return GestureDetector(
      onTap: () {
        ref.read(categoryProvider.notifier).state = widget.category;
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSameCategory
                ? Colors.redAccent
                : Colors.transparent,
          ),
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(3),
        child: TaskIconCard(
          color: widget.category.color,
          iconData: widget.category.icon,
        ),
      ),
    );
  }
}
