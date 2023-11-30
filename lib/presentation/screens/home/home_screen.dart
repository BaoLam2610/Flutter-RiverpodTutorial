import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../utils/extensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              height: context.deviceSize.height / 3,
              width: context.deviceSize.width,
              decoration: BoxDecoration(
                  color: context.colorScheme.primary,
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(20))),
            ),
            Column(
              children: [
                const Gap(30),
                Text(
                  'Today is good day',
                  style: context.textTheme.headlineSmall?.copyWith(
                    color: context.colorScheme.surface,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'My Todo List',
                  style: context.textTheme.headlineSmall?.copyWith(
                    color: context.colorScheme.surface,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                Expanded(
                  child: _buildTaskListArea(),
                ),
                Text(
                  'Completed',
                  style: context.textTheme.headlineSmall?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Expanded(
                  child: _buildTaskListArea(),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.colorScheme.primary,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    'Add new task',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Gap(20),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildTaskListArea() => Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.blue[50], borderRadius: BorderRadius.circular(20)),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return const Text('Home');
          },
        ),
      );
}
