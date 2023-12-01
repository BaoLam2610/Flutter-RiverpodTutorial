import 'package:floor/floor.dart';
import 'package:rivepod_tutorial/data/data_sources/local/entities/task_entity.dart';
import 'package:rivepod_tutorial/utils/app_keys.dart';

@dao
abstract class TaskDao {
  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertTask(TaskEntity entity);

  @delete
  Future<void> deleteTask(TaskEntity entity);

  @Query('SELECT * FROM ${AppKeys.tableName}')
  Future<List<TaskEntity>> getTasks();
}
