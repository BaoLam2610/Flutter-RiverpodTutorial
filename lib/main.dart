import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rivepod_tutorial/app/todo_app.dart';
import 'package:rivepod_tutorial/di/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInject();
  runApp(const ProviderScope(child: ToDoApp()));
}