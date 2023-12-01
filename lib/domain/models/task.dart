import 'package:equatable/equatable.dart';
import 'package:rivepod_tutorial/data/data_sources/local/entities/task_entity.dart';
import 'package:rivepod_tutorial/domain/models/task_category.dart';

class Task extends Equatable {
  final int? id;
  final String title;
  final String note;
  final String time;
  final String date;
  final bool isCompleted;
  final TaskCategory category;

  const Task({
    this.id,
    required this.title,
    required this.note,
    required this.time,
    required this.date,
    required this.isCompleted,
    required this.category,
  });

  @override
  List<Object?> get props {
    return [
      id,
      title,
      time,
      date,
      isCompleted,
    ];
  }

  TaskEntity toEntity() => TaskEntity(
    id: id,
    title: title,
    note: note,
    date: date,
    time: time,
    isCompleted: isCompleted,
    categoryType: category.type,
  );
}
