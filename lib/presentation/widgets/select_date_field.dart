import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rivepod_tutorial/providers/providers.dart';
import 'package:intl/intl.dart';

import 'widgets.dart';

class SelectDateField extends ConsumerWidget {
  const SelectDateField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    return LabelTextField(
      label: 'Date',
      hintText: DateFormat.yMMMd().format(date),
      suffixIcon: Icons.calendar_month_outlined,
      readOnly: true,
      onTap: () => _openDatePicker(context, ref),
    );
  }

  void _openDatePicker(BuildContext context, WidgetRef ref) async {
    final initialDate = ref.read(dateProvider);
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2090),
    );

    if (pickedDate != null) {
      ref.read(dateProvider.notifier).state = pickedDate;
    }
  }
}
