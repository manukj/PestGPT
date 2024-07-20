import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

class ToastManager {
  static void showError(String message) {
    toastification.show(
      context: Get.context,
      title: Text(message),
      type: ToastificationType.error,
      autoCloseDuration: const Duration(seconds: 5),
      style: ToastificationStyle.fillColored,
      alignment: Alignment.bottomCenter,
    );
  }

  static void showSuccess(String message) {
    toastification.show(
      context: Get.context,
      title: Text(message),
      type: ToastificationType.success,
      autoCloseDuration: const Duration(seconds: 5),
      style: ToastificationStyle.fillColored,
      alignment: Alignment.bottomCenter,
    );
  }
}
