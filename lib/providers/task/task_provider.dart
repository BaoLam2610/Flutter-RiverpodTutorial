import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rivepod_tutorial/core/core.dart';
import 'package:rivepod_tutorial/di/injection_container.dart';
import 'package:rivepod_tutorial/providers/task/task_notifier.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, Resource>((ref) {
  final getAllTaskUseCase = ref.watch(getAllTasksProvider);
  final createTaskUseCase = ref.watch(createTaskProvider);
  final deleteTaskUseCase = ref.watch(deleteTaskProvider);
  return TaskNotifier(
    getAllTaskUseCase,
    createTaskUseCase,
    deleteTaskUseCase,
  );
});
