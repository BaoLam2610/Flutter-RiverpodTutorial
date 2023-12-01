import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rivepod_tutorial/utils/extensions.dart';

class LabelTextField extends StatelessWidget {
  final String label;
  final String? hintText;
  final TextEditingController? controller;
  final IconData? suffixIcon;
  final int? maxLines;
  final bool readOnly;
  final VoidCallback? onTap;
  const LabelTextField({
    super.key,
    required this.label,
    this.hintText,
    this.controller,
    this.suffixIcon,
    this.maxLines,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: context.colorScheme.primary));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.titleLarge,
        ),
        const Gap(4),
        TextField(
          onTap: onTap,
          readOnly: readOnly,
          onTapOutside: (event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: context.colorScheme.primary.withOpacity(0.6),
              fontWeight: FontWeight.normal,
            ),
            enabledBorder: border,
            focusedBorder: border,
            filled: true,
            fillColor: context.colorScheme.primary.withOpacity(0.2),
            suffixIcon: suffixIcon == null
                ? null
                : Icon(
                    suffixIcon,
                    color: context.colorScheme.primary,
                  ),
          ),
          maxLines: maxLines,
        ),
      ],
    );
  }
}
