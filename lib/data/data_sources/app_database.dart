import 'dart:async';

import 'package:floor/floor.dart';
import 'package:rivepod_tutorial/data/data_sources/local/dao/task_dao.dart';
import 'package:rivepod_tutorial/data/data_sources/local/entities/task_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'app_database.g.dart';

@Database(version: 1, entities: [TaskEntity])
abstract class AppDatabase extends FloorDatabase {
  TaskDao get dao;
}
