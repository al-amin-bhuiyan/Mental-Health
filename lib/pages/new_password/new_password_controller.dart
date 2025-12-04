import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPasswordController extends GetxController {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController updatePasswordController = TextEditingController();

  final RxBool isNewPasswordHidden = true.obs;
  final RxBool isUpdatePasswordHidden = true.obs;

  @override
  void onClose() {
    newPasswordController.dispose();
    updatePasswordController.dispose();
    super.onClose();
  }

  void toggleNewPasswordVisibility() {
    isNewPasswordHidden.value = !isNewPasswordHidden.value;
  }

  void toggleUpdatePasswordVisibility() {
    isUpdatePasswordHidden.value = !isUpdatePasswordHidden.value;
  }

  void changePassword(BuildContext context) {
    final newPassword = newPasswordController.text.trim();
    final updatePassword = updatePasswordController.text.trim();

    if (newPassword.isEmpty || updatePassword.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill all fields',
        backgroundColor: Colors.red.withValues(alpha: 0.9),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    if (newPassword != updatePassword) {
      Get.snackbar(
        'Error',
        'Passwords do not match',
        backgroundColor: Colors.red.withValues(alpha: 0.9),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    if (newPassword.length < 6) {
      Get.snackbar(
        'Error',
        'Password must be at least 6 characters',
        backgroundColor: Colors.red.withValues(alpha: 0.9),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    // Handle password change logic here
    print('New Password: $newPassword');
    Get.snackbar(
      'Success',
      'Password changed successfully!',
      backgroundColor: Colors.green.withValues(alpha: 0.9),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );

    // Navigate to login or home screen
    // context.go('/login');
  }
}

