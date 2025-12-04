import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../core/app_route/app_path.dart';

class SignUpController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final RxBool isPasswordHidden = true.obs;
  final RxBool isConfirmPasswordHidden = true.obs;

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    locationController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }

  void signUp(BuildContext context) {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final location = locationController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    // Validation
    if (name.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your name',
        backgroundColor: Colors.red.withValues(alpha: 0.9),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    if (email.isEmpty || !GetUtils.isEmail(email)) {
      Get.snackbar(
        'Error',
        'Please enter a valid email',
        backgroundColor: Colors.red.withValues(alpha: 0.9),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    if (location.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your location',
        backgroundColor: Colors.red.withValues(alpha: 0.9),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    if (password.isEmpty || password.length < 6) {
      Get.snackbar(
        'Error',
        'Password must be at least 6 characters',
        backgroundColor: Colors.red.withValues(alpha: 0.9),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    if (password != confirmPassword) {
      Get.snackbar(
        'Error',
        'Passwords do not match',
        backgroundColor: Colors.red.withValues(alpha: 0.9),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      return;
    }


    // Handle sign up logic here
    print('Sign up with: $name, $email, $location');
    Get.snackbar(
      'Success',
      'Verification code sent to your email!',
      backgroundColor: Colors.green.withValues(alpha: 0.9),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );

    // Navigate to verification code screen with showTitle=true (from sign_up)
    Future.delayed(const Duration(milliseconds: 100), () {
      context.push('${AppPath.otpVerification}?showTitle=true');
    });

  }

  void signUpWithGoogle() {
    print('Sign up with Google');
    Get.snackbar(
      'Google Sign Up',
      'Google authentication coming soon',
      backgroundColor: Colors.blue.withValues(alpha: 0.9),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );
  }

  void signUpWithApple() {
    print('Sign up with Apple');
    Get.snackbar(
      'Apple Sign Up',
      'Apple authentication coming soon',
      backgroundColor: Colors.black.withValues(alpha: 0.9),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );
  }

  void navigateToLogin(BuildContext context) {
    context.go(AppPath.login);
  }
}

