import 'package:get_it/get_it.dart';

import '../data/data_sources/app_database.dart';
import '../utils/utils.dart';

final sl = GetIt.instance;

Future<void> initInject() async {
  final database =
      await $FloorAppDatabase.databaseBuilder(AppKeys.dbName).build();
  sl.registerSingleton<AppDatabase>(database);
}