import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:rivepod_tutorial/domain/models/models.dart';

import 'package:rivepod_tutorial/utils/app_keys.dart';

@Entity(tableName: AppKeys.tableName)
class TaskEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String? title;
  final String? note;
  final String? time;
  final String? date;
  final bool? isCompleted;
  final int? categoryType;

  TaskEntity({
    this.id,
    this.title,
    this.note,
    this.time,
    this.date,
    this.isCompleted,
    this.categoryType,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'note': note,
      'time': time,
      'date': date,
      'isCompleted': isCompleted,
      'categoryType': categoryType,
    };
  }

  factory TaskEntity.fromMap(Map<String, dynamic> map) {
    return TaskEntity(
      id: map['id']?.toInt(),
      title: map['title'],
      note: map['note'],
      time: map['time'],
      date: map['date'],
      isCompleted: map['isCompleted'],
      categoryType: map['categoryType'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskEntity.fromJson(String source) =>
      TaskEntity.fromMap(json.decode(source));

  Task toDomain() => Task(
        id: id,
        title: title ?? '',
        note: note ?? '',
        time: time ?? '',
        date: date ?? '',
        isCompleted: isCompleted ?? false,
        category: TaskCategory.values[categoryType ?? 0],
      );
}
