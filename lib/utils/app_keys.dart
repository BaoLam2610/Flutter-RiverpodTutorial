import 'package:flutter/material.dart';

@immutable
class AppKeys {
  const AppKeys._();

  static const String dbName = 'task.db';
  static const String tableName = 'task';

  static const String id = 'id';
  static const String title = 'title';
  static const String note = 'note';
  static const String time = 'time';
  static const String date = 'date';
  static const String isCompleted = 'isCompleted';
  static const String category = 'category';
 }
