import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:rivepod_tutorial/data/repository/task_repository.dart';
import 'package:rivepod_tutorial/domain/repository/task_repository_impl.dart';
import 'package:rivepod_tutorial/domain/use_cases/use_cases.dart';

import '../data/data_sources/app_database.dart';
import '../utils/utils.dart';

final sl = GetIt.instance;

Future<void> initInject() async {
  final database =
      await $FloorAppDatabase.databaseBuilder(AppKeys.dbName).build();
  sl.registerSingleton<AppDatabase>(database);

  sl.registerSingleton<TaskRepository>(TaskRepositoryImpl(sl()));

  // sl.registerSingleton<GetAllTasksUseCase>(GetAllTasksUseCase(sl()));
  // sl.registerSingleton<CreateTaskUseCase>(CreateTaskUseCase(sl()));
  // sl.registerSingleton<DeleteTaskUseCase>(DeleteTaskUseCase(sl()));
}

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  return TaskRepositoryImpl(sl.get<AppDatabase>());
});

final getAllTasksProvider = Provider<GetAllTasksUseCase>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return GetAllTasksUseCase(repository);
});

final createTaskProvider = Provider<CreateTaskUseCase>((ref) {
  final repository = ref.watch(taskRepositoryProvider);

  return CreateTaskUseCase(repository);
});

final deleteTaskProvider = Provider<DeleteTaskUseCase>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return DeleteTaskUseCase(repository);
});
