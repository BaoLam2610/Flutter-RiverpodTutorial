import '../../domain/models/models.dart';

abstract class TaskRepository {
  Future<void> addTask(Task task);
  Future<void> deleteTask(Task task);
  Future<List<Task>> getTasks();
}
