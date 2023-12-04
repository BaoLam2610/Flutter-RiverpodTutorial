import 'package:rivepod_tutorial/data/repository/task_repository.dart';
import 'package:rivepod_tutorial/domain/models/models.dart';

import '../../core/core.dart';

class GetAllTasksUseCase extends UseCase<List<Task>, void> {
  final TaskRepository _repository;

  GetAllTasksUseCase(this._repository);

  @override
  Future<List<Task>> call({void params}) {
    return _repository.getTasks();
  }
}
