import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:note_app/core/constant/app_colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final EdgeInsetsGeometry? padding;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final AutovalidateMode? autovalidateMode;
  final bool? autofocus;

  const TextFormFieldWidget({
    super.key,
    this.hintText,
    this.labelText,
    this.padding,
    this.obscureText,
    this.controller,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.autovalidateMode,
    this.autofocus,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(32),
          Text(
            labelText ?? "",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const Gap(12),
          TextFormField(
            obscureText: obscureText ?? false,
            controller: controller,
            validator: validator,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
            autofocus: autofocus ?? false,
            decoration: InputDecoration(
              hintText: hintText ?? "",
              hintStyle: const TextStyle(
                  color: AppColors.textColorBaseGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              contentPadding: const EdgeInsets.all(16),
            ),
          ),
        ],
      ),
    );
  }
}
