import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 40.h),
                  // Harbor Logo
                  Center(
                    child: SvgPicture.asset(
                      CustomAssets.signinharborlogo,
                      width: 180.w,
                      height: 60.h,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  // Sign in to your account
                  Center(
                    child: Text(
                      'Sign in to your account',
                      style: AppFonts.urbanistSemiBold(
                        fontSize: 24.sp,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  // Enter your email address and password to log in
                  Center(
                    child: Text(
                      'Enter your email address and password to log in',
                      style: AppFonts.urbanistRegular(
                        fontSize: 14.sp,
                        color: AppColors.white500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  // Email Field
                  Text(
                    'Email',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 14.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  TextField(
                    controller: controller.emailController,
                    style: AppFonts.urbanistRegular(
                      fontSize: 14.sp,
                      color: AppColors.whiteColor,
                    ),
                    decoration: InputDecoration(
                      hintText: 'anthony@gmail.com',
                      hintStyle: AppFonts.urbanistRegular(
                        fontSize: 14.sp,
                        color: AppColors.white500.withValues(alpha: 0.6),
                      ),
                      filled: true,
                      fillColor: Colors.white.withValues(alpha: 0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(
                          color: AppColors.white500.withValues(alpha: 0.3),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(
                          color: AppColors.white500.withValues(alpha: 0.3),
                        ),
                      ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                            color: AppColors.primaryColor,
                            width: 2.w,
                          ),
                        ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  // Password Field
                  Text(
                    'Password',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 14.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Obx(
                    () => TextField(
                      controller: controller.passwordController,
                      obscureText: controller.isPasswordHidden.value,
                      style: AppFonts.urbanistRegular(
                        fontSize: 14.sp,
                        color: AppColors.whiteColor,
                      ),
                      decoration: InputDecoration(
                        hintText: '••••••••',
                        hintStyle: AppFonts.urbanistRegular(
                          fontSize: 14.sp,
                          color: AppColors.white500.withValues(alpha: 0.6),
                        ),
                        filled: true,
                        fillColor: Colors.white.withValues(alpha: 0.1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                            color: AppColors.white500.withValues(alpha: 0.3),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                            color: AppColors.white500.withValues(alpha: 0.3),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                            color: AppColors.primaryColor,
                            width: 2.w,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isPasswordHidden.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: AppColors.white500,
                            size: 24.sp,
                          ),
                          onPressed: controller.togglePasswordVisibility,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
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
                                fontSize: 14.sp,
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
                            fontSize: 14.sp,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  // Log In Button
                  SizedBox(
                    width: double.infinity,
                    height: 56.h,
                    child: ElevatedButton(
                      onPressed: () => controller.signIn(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Log In',
                        style: AppFonts.urbanistSemiBold(
                          fontSize: 18.sp,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  // Or continue with
                  Center(
                    child: Text(
                      'or continue with',
                      style: AppFonts.urbanistRegular(
                        fontSize: 14.sp,
                        color: AppColors.white500,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  // Continue with Google
                  SizedBox(
                    width: double.infinity,
                    height: 56.h,
                    child: OutlinedButton(
                      onPressed: controller.signInWithGoogle,
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: AppColors.white500.withValues(alpha: 0.3),
                          width: 1.w,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        backgroundColor: Colors.white.withValues(alpha: 0.1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            CustomAssets.googleIcon,
                            width: 24.w,
                            height: 24.h,
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            'Continue with Google',
                            style: AppFonts.urbanistSemiBold(
                              fontSize: 16.sp,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  // Continue with Apple
                  SizedBox(
                    width: double.infinity,
                    height: 56.h,
                    child: OutlinedButton(
                      onPressed: controller.signInWithApple,
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: AppColors.white500.withValues(alpha: 0.3),
                          width: 1.w,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        backgroundColor: Colors.white.withValues(alpha: 0.1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            CustomAssets.appleIcon,
                            width: 24.w,
                            height: 24.h,
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            'Continue with Apple',
                            style: AppFonts.urbanistSemiBold(
                              fontSize: 16.sp,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  // Don't have an account? Sign Up
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account? ',
                          style: AppFonts.urbanistRegular(
                            fontSize: 14.sp,
                            color: AppColors.white500,
                          ),
                        ),
                        TextButton(
                          onPressed: () => controller.goToSignUp(context),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Sign Up',
                            style: AppFonts.urbanistSemiBold(
                              fontSize: 14.sp,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

