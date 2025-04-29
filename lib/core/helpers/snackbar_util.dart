// lib/core/utils/snackbar_util.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarUtil {
  static const Duration _debounceDuration = Duration(seconds: 3);
  static Timer? _debounceTimer;

  /// Hiện Snackbar với GetX, ở vị trí TOP
  static void show({
    required String title,
    required String message,
    bool isError = false,
  }) {
    // Debounce: nếu đang active thì skip
    if (_debounceTimer?.isActive ?? false) return;

    final ctx = Get.context;
    if (ctx == null) return;

    final snackTheme = Theme.of(ctx).snackBarTheme;
    final bgColor = isError
        ? snackTheme.backgroundColor ?? Colors.redAccent
        : snackTheme.backgroundColor ?? Colors.green;
    final textColor = snackTheme.contentTextStyle?.color ?? Colors.white;

    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,
      backgroundColor: bgColor,
      colorText: textColor,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      duration: const Duration(seconds: 2),
    );

    // Bắt đầu timer để debounce
    _debounceTimer = Timer(_debounceDuration, () {});
  }

  static void showError(String message) =>
      show(title: 'Lỗi', message: message, isError: true);
  static void showSuccess(String message) =>
      show(title: 'Thành công', message: message, isError: false);
}
