

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/models/models.dart';

final categoryProvider = StateProvider<TaskCategory>((ref) {
  return TaskCategory.others;
});