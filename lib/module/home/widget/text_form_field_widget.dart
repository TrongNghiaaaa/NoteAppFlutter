import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:note_app/core/constant/app_colors.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final EdgeInsetsGeometry? padding;
  final bool obscureText;
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
    this.obscureText = false,
    this.controller,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.autovalidateMode,
    this.autofocus,
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(32),
          Text(
            widget.labelText ?? "",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const Gap(12),
          TextFormField(
            obscureText: _isObscured,
            controller: widget.controller,
            validator: widget.validator,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            autovalidateMode:
                widget.autovalidateMode ?? AutovalidateMode.disabled,
            autofocus: widget.autofocus ?? false,
            decoration: InputDecoration(
              hintText: widget.hintText ?? "",
              hintStyle: const TextStyle(
                  color: AppColors.textColorBaseGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              contentPadding: const EdgeInsets.all(16),
              suffixIcon: widget.obscureText
                  ? IconButton(
                      icon: Icon(
                        _isObscured ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      },
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
