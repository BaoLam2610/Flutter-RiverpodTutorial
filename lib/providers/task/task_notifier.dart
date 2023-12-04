import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rivepod_tutorial/domain/models/task.dart';
import 'package:rivepod_tutorial/domain/use_cases/use_cases.dart';

import '../../core/core.dart';

class TaskNotifier extends StateNotifier<Resource> {
  final GetAllTasksUseCase _getAllTasksUseCase;
  final CreateTaskUseCase _createTaskUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;

  TaskNotifier(
    this._getAllTasksUseCase,
    this._createTaskUseCase,
    this._deleteTaskUseCase,
  ) : super(Initialize()) {
    getAllTasks();
  }

  Future<void> createTask(Task task) async {
    try {
      if (task.title.isEmpty) {
        state = Error(message: 'Title cannot be empty!');
        return;
      }
      await _createTaskUseCase.call(params: task);
      state = Success();
      getAllTasks();
    } catch (e) {
      state = Error(message: e.toString());
    }
  }

  Future<void> deleteTask(Task task) async {
    try {
      await _deleteTaskUseCase.call(params: task);
      getAllTasks();
    } catch (e) {
      state = Error(message: e.toString());
    }
  }

  Future<void> getAllTasks() async {
    try {
      final data = await _getAllTasksUseCase.call();
      state = Success(data: data);
    } catch (e) {
      state = Error(message: e.toString());
    }
  }
}
