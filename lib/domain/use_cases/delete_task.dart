import 'package:rivepod_tutorial/core/core.dart';
import 'package:rivepod_tutorial/data/repository/task_repository.dart';
import 'package:rivepod_tutorial/domain/models/task.dart';

class DeleteTaskUseCase extends UseCase<void, Task> {
  final TaskRepository _taskRepository;
  DeleteTaskUseCase(this._taskRepository);

  @override
  Future<void> call({Task? params}) {
    return _taskRepository.deleteTask(params!);
  }
}
