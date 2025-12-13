import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../utils/app_colors/app_colors.dart';

class ChangePasswordController extends GetxController {
  // Text editing controllers
  late TextEditingController currentPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;

  // Observable for password visibility
  var isCurrentPasswordVisible = false.obs;
  var isNewPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void onClose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  // Toggle password visibility
  void toggleCurrentPasswordVisibility() {
    isCurrentPasswordVisible.value = !isCurrentPasswordVisible.value;
  }

  void toggleNewPasswordVisibility() {
    isNewPasswordVisible.value = !isNewPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  // Update password
  void updatePassword(BuildContext context) {
    // Validate fields
    if (currentPasswordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your current password',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: AppColors.whiteColor,
      );
      return;
    }

    if (newPasswordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter a new password',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: AppColors.whiteColor,
      );
      return;
    }

    if (confirmPasswordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please confirm your new password',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: AppColors.whiteColor,
      );
      return;
    }

    if (newPasswordController.text != confirmPasswordController.text) {
      Get.snackbar(
        'Error',
        'New password and confirm password do not match',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: AppColors.whiteColor,
      );
      return;
    }

    if (newPasswordController.text.length < 6) {
      Get.snackbar(
        'Error',
        'Password must be at least 6 characters',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: AppColors.whiteColor,
      );
      return;
    }

    // TODO: Implement API call to update password
    Get.snackbar(
      'Success',
      'Password updated successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primaryColor,
      colorText: AppColors.whiteColor,
    );

    // Navigate back
    context.pop();
  }
}

