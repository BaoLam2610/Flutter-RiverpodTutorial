import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import '../../utils/utils.dart';
import 'widgets.dart';

class SelectTimeField extends ConsumerWidget {
  const SelectTimeField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = ref.watch(timeProvider);
    return LabelTextField(
      label: 'Time',
      hintText: Helpers.timeToString(time),
      suffixIcon: Icons.timer_outlined,
      readOnly: true,
      onTap: () => _openTimePicker(context, ref),
    );
  }

  void _openTimePicker(BuildContext context, WidgetRef ref) async {
    final initialTime = ref.read(timeProvider);
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (pickedTime != null) {
      ref.read(timeProvider.notifier).state = pickedTime;
    }
  }
}
