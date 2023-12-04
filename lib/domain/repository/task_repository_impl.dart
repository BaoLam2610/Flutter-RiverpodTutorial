import 'package:rivepod_tutorial/data/data_sources/app_database.dart';
import 'package:rivepod_tutorial/data/repository/task_repository.dart';
import 'package:rivepod_tutorial/domain/models/task.dart';

class TaskRepositoryImpl implements TaskRepository {
  AppDatabase database;

  TaskRepositoryImpl(this.database);

  @override
  Future<void> addTask(Task task) {
    return database.dao.insertTask(task.toEntity());
  }

  @override
  Future<void> deleteTask(Task task) {
    return database.dao.deleteTask(task.toEntity());
  }

  @override
  Future<List<Task>> getTasks() {
    return database.dao.getTasks().then(
          (value) => value
              .map(
                (e) => e.toDomain(),
              )
              .toList(),
        );
  }
}
