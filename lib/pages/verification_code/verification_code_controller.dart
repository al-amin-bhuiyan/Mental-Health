import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:mental_health/core/app_route/app_path.dart';

class VerificationCodeController extends GetxController {
  final List<TextEditingController> otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> focusNodes = List.generate(
    6,
    (index) => FocusNode(),
  );
  final RxList<String> otpValues = List.generate(6, (index) => '').obs;

  // Track whether to show title (true = from sign_up, false = from forget_password)
  bool isFromSignUp = true;

  @override
  void onClose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.onClose();
  }

  void setNavigationSource(bool fromSignUp) {
    isFromSignUp = fromSignUp;
  }

  void onOtpChanged(int index, String value) {
    otpValues[index] = value;
    if (value.isNotEmpty && index < 5) {
      focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  void verifyCode(BuildContext context) {
    String code = otpControllers.map((controller) => controller.text).join();
    if (code.length == 6) {
      // Handle verification logic
      print('Verification code: $code');

      Get.snackbar(
        'Success',
        'Code verified successfully!',
        backgroundColor: Colors.green.withValues(alpha: 0.9),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );

      // Navigate based on source
      Future.delayed(const Duration(milliseconds: 800), () {
        if (isFromSignUp) {
          // From sign up -> go to tell us yourself onboarding
          context.go(AppPath.tellUsYourself);
        } else {
          // From forget password -> go to new password page
          context.push(AppPath.newPassword);
        }
      });
    } else {
      Get.snackbar(
        'Error',
        'Please enter complete verification code',
        backgroundColor: Colors.red.withValues(alpha: 0.9),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  void resendCode() {
    print('Resending code...');
    Get.snackbar(
      'Success',
      'Verification code sent to your email',
      backgroundColor: Colors.green.withValues(alpha: 0.9),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );
  }
}

