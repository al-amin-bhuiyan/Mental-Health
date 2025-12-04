import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../core/app_route/app_path.dart';

class ForgetPasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();

  void sendCode(BuildContext context) {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your email address',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // TODO: Implement send code logic
    print('Send code to: $email');

    // Show success message
    Get.snackbar(
      'Success',
      'Password reset code sent to $email',
      snackPosition: SnackPosition.BOTTOM,
    );

    // Navigate to verification code screen with showTitle=false (from forget_password)
    context.push('${AppPath.otpVerification}?showTitle=false');
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}

