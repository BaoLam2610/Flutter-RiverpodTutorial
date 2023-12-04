import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rivepod_tutorial/utils/utils.dart';

class AppAlerts {
  AppAlerts._();

  static showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: context.textTheme.bodyLarge?.copyWith(color: Colors.white),
          ),
        ),
      );
  }

  static Future<void> showAlertDialog(
    BuildContext context, {
    required String title,
    String textAccept = 'OK',
    String textCancel = 'Cancel',
    VoidCallback? onAccept,
    VoidCallback? onCancel,
  }) =>
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            title,
            style: context.textTheme.titleMedium,
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (onCancel != null) onCancel();
                context.pop();
              },
              child: Text(
                textCancel,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                if (onAccept != null) onAccept();
                context.pop();
              },
              child: Text(
                textAccept,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
            )
          ],
        ),
      );

  static showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}