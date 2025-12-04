import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../core/app_route/route_path.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool isPasswordHidden = true.obs;
  final RxBool keepMeLoggedIn = false.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void signIn(BuildContext context) {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter email and password',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // TODO: Implement sign in logic
    print('Sign in with: $email');

    // Navigate to home screen
    context.pushNamed(RoutePath.tellUsYourself);
  }

  void signInWithGoogle() {
    // TODO: Implement Google sign in
    print('Sign in with Google');
  }

  void signInWithApple() {
    // TODO: Implement Apple sign in
    print('Sign in with Apple');
  }

  void forgotPassword(BuildContext context) {
    // Navigate to forgot password screen
    context.pushNamed(RoutePath.forgetPassword);
  }

  void goToSignUp(BuildContext context) {
    // Navigate to sign up screen
    context.pushNamed(RoutePath.signup);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

