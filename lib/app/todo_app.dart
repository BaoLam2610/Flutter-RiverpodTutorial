import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rivepod_tutorial/data/models.dart';
import 'package:http/http.dart' as http;

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Demo3(),
    );
  }
}

final nameProvider = Provider<String>((ref) {
  return "Hello";
});

final nameStateProvider = StateProvider<String>((ref) {
  return "Hello World 2";
});

final userChangeNotifierProvider = ChangeNotifierProvider((ref) {
  return UserNotifierChange();
});

final userProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  // return UserNotifier(const User(name: 'Bao Lam', age: 23));
  return UserNotifier();
});

class Demo1 extends ConsumerWidget {
  const Demo1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameStateProvider);

    print('lamnb: rebuild');
    final user = ref.watch(userChangeNotifierProvider).user;
    // final user = ref.watch(userProvider);
    // only rebuild when name change
    final userName = ref.watch(userProvider.select((value) => value.name));

    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              onSubmitted: (value) {
                // ref.read(nameStateProvider.notifier).update((state) => value);
                // ref.read(userProvider.notifier).updateName(value);
                ref.read(userChangeNotifierProvider).updateName(value);
              },
            ),
            TextField(
              onSubmitted: (value) {
                // ref.read(userProvider.notifier).updateAge(int.parse(value));
                ref
                    .read(userChangeNotifierProvider)
                    .updateAge(int.parse(value));
              },
            ),
            Text(user.toString()),
          ],
        ),
      ),
    );
  }
}

final fetchUserProvider = FutureProvider((ref) {
  const url = 'https://jsonplaceholder.typicode.com/users/1';
  return http.get(Uri.parse(url)).then((value) => User.fromJson(value.body));
});

class Demo2 extends StatelessWidget {
  const Demo2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final name = ref.watch(nameProvider);
          return Center(
            child: Text(name),
          );
        },
      ),
    );
  }
}

class Demo3 extends ConsumerWidget {
  const Demo3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo fetch user'),
      ),
      body: _buildLayout(ref),
    );
  }

  _buildLayout(WidgetRef ref) {
    return ref.watch(fetchUserProvider).when(
          data: (data) => Text(data.name),
          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}
