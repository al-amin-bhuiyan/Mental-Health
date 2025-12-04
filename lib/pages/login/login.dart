import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../core/custom_assets/custom_assets.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_fonts/app_fonts.dart';
import 'login_contorller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            CustomAssets.onBoardingImage,
            fit: BoxFit.cover,
          ),
          // Overlay gradient for better text visibility
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.3),
                  Colors.black.withValues(alpha: 0.6),
                ],
              ),
            ),
          ),
          // Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  // Sign In text at top
                  Text(
                    'Sign In',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 16,
                      color: AppColors.white500,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Harbor Logo
                  Center(
                    child: SvgPicture.asset(
                      CustomAssets.signinharborlogo,
                      width: 180,
                      height: 60,
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Sign in to your account
                  Center(
                    child: Text(
                      'Sign in to your account',
                      style: AppFonts.urbanistSemiBold(
                        fontSize: 24,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Enter your email address and password to log in
                  Center(
                    child: Text(
                      'Enter your email address and password to log in',
                      style: AppFonts.urbanistRegular(
                        fontSize: 14,
                        color: AppColors.white500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Email Field
                  Text(
                    'Email',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 14,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: controller.emailController,
                    style: AppFonts.urbanistRegular(
                      fontSize: 14,
                      color: AppColors.whiteColor,
                    ),
                    decoration: InputDecoration(
                      hintText: 'anthony@gmail.com',
                      hintStyle: AppFonts.urbanistRegular(
                        fontSize: 14,
                        color: AppColors.white500.withValues(alpha: 0.6),
                      ),
                      filled: true,
                      fillColor: Colors.white.withValues(alpha: 0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: AppColors.white500.withValues(alpha: 0.3),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: AppColors.white500.withValues(alpha: 0.3),
                        ),
                      ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: AppColors.primaryColor,
                            width: 2,
                          ),
                        ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Password Field
                  Text(
                    'Password',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 14,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Obx(
                    () => TextField(
                      controller: controller.passwordController,
                      obscureText: controller.isPasswordHidden.value,
                      style: AppFonts.urbanistRegular(
                        fontSize: 14,
                        color: AppColors.whiteColor,
                      ),
                      decoration: InputDecoration(
                        hintText: '••••••••',
                        hintStyle: AppFonts.urbanistRegular(
                          fontSize: 14,
                          color: AppColors.white500.withValues(alpha: 0.6),
                        ),
                        filled: true,
                        fillColor: Colors.white.withValues(alpha: 0.1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: AppColors.white500.withValues(alpha: 0.3),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: AppColors.white500.withValues(alpha: 0.3),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: AppColors.primaryColor,
                            width: 2,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isPasswordHidden.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: AppColors.white500,
                          ),
                          onPressed: controller.togglePasswordVisibility,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Keep me logged in and Forgot Password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Row(
                          children: [
                            Checkbox(
                              value: controller.keepMeLoggedIn.value,
                              onChanged: (value) {
                                controller.keepMeLoggedIn.value = value ?? false;
                              },
                              activeColor: AppColors.primaryColor,
                              checkColor: AppColors.whiteColor,
                              side: BorderSide(
                                color: AppColors.white500.withValues(alpha: 0.5),
                              ),
                            ),
                            Text(
                              'Keep me logged in',
                              style: AppFonts.urbanistRegular(
                                fontSize: 14,
                                color: AppColors.white500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () => controller.forgotPassword(context),
                        child: Text(
                          'Forgot Password?',
                          style: AppFonts.urbanistSemiBold(
                            fontSize: 14,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Log In Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () => controller.signIn(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Log In',
                        style: AppFonts.urbanistSemiBold(
                          fontSize: 18,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Or continue with
                  Center(
                    child: Text(
                      'or continue with',
                      style: AppFonts.urbanistRegular(
                        fontSize: 14,
                        color: AppColors.white500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Continue with Google
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: OutlinedButton(
                      onPressed: controller.signInWithGoogle,
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: AppColors.white500.withValues(alpha: 0.3),
                          width: 1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors.white.withValues(alpha: 0.1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            CustomAssets.googleIcon,
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Continue with Google',
                            style: AppFonts.urbanistSemiBold(
                              fontSize: 16,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Continue with Apple
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: OutlinedButton(
                      onPressed: controller.signInWithApple,
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: AppColors.white500.withValues(alpha: 0.3),
                          width: 1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors.white.withValues(alpha: 0.1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            CustomAssets.appleIcon,
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Continue with Apple',
                            style: AppFonts.urbanistSemiBold(
                              fontSize: 16,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Don't have an account? Sign Up
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account? ',
                          style: AppFonts.urbanistRegular(
                            fontSize: 14,
                            color: AppColors.white500,
                          ),
                        ),
                        TextButton(
                          onPressed: () => controller.goToSignUp(context),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Sign Up',
                            style: AppFonts.urbanistSemiBold(
                              fontSize: 14,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

