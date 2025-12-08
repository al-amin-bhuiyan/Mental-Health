import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../core/custom_assets/custom_assets.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_fonts/app_fonts.dart';
import 'sign_up_controller.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

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
                  Colors.black.withValues(alpha: 0.4),
                  Colors.black.withValues(alpha: 0.7),
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
                   SizedBox(height: 30.h),
                  // Harbor Logo
                  Center(
                    child: SvgPicture.asset(
                      CustomAssets.signinharborlogo,
                      width: 180.w,
                      height: 60.h,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  // Sign up title
                  Center(
                    child: Text(
                      'Sign up',
                      style: AppFonts.urbanistSemiBold(
                        fontSize: 2.sp,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  // Subtitle
                  Center(
                    child: Text(
                      'Create an account to continue',
                      style: AppFonts.urbanistRegular(
                        fontSize: 1.sp,
                        color: AppColors.white500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  // Name Field
                  Text(
                    'Name',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 1.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  TextField(
                    controller: controller.nameController,
                    style: AppFonts.urbanistRegular(
                      fontSize: 14.sp,
                      color: AppColors.whiteColor,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Anthony',
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
                  SizedBox(height: 20),
                  // Email Field
                  Text(
                    'Email',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 14.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
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
                  SizedBox(height: 20),
                  // Location Field
                  Text(
                    'Location',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 14.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: controller.locationController,
                    style: AppFonts.urbanistRegular(
                      fontSize: 14.sp,
                      color: AppColors.whiteColor,
                    ),
                    decoration: InputDecoration(
                      hintText: 'USA',
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
                  SizedBox(height: 20),
                  // Password Field
                  Text(
                    'Password',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 14.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(height: 8),
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
                          ),
                          onPressed: controller.togglePasswordVisibility,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Confirm Password Field
                  Text(
                    'Confirm Password',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 14.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(height: 8),
                  Obx(
                    () => TextField(
                      controller: controller.confirmPasswordController,
                      obscureText: controller.isConfirmPasswordHidden.value,
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
                            controller.isConfirmPasswordHidden.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: AppColors.white500,
                          ),
                          onPressed: controller.toggleConfirmPasswordVisibility,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  // Sign Up Button
                  SizedBox(
                    width: double.infinity,
                    height: 56.h,
                    child: ElevatedButton(
                      onPressed: () => controller.signUp(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Sign Up',
                        style: AppFonts.urbanistSemiBold(
                          fontSize: 16.sp,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  // Or continue with divider
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColors.white500.withValues(alpha: 0.3),
                          thickness: 1.h,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'or continue with',
                          style: AppFonts.urbanistRegular(
                            fontSize: 14.sp,
                            color: AppColors.white500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: AppColors.white500.withValues(alpha: 0.3),
                          thickness: 1.h,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Google Sign In Button
                  SizedBox(
                    width: double.infinity,
                    height: 56.h,
                    child: ElevatedButton(
                      onPressed: controller.signUpWithGoogle,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withValues(alpha: 0.15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          side: BorderSide(
                            color: AppColors.white500.withValues(alpha: 0.3),
                          ),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            CustomAssets.googleIcon,
                            width: 24.w,
                            height: 24.h,
                          ),
                          SizedBox(width: 12),
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
                  SizedBox(height: 16),
                  // Apple Sign In Button
                  SizedBox(
                    width: double.infinity,
                    height: 56.h,
                    child: ElevatedButton(
                      onPressed: controller.signUpWithApple,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withValues(alpha: 0.15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          side: BorderSide(
                            color: AppColors.white500.withValues(alpha: 0.3),
                          ),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            CustomAssets.appleIcon,
                            width: 24.w,
                            height: 24.h,
                          ),
                          SizedBox(width: 12),
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
                  SizedBox(height: 24),
                  // Already have an account? Login
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: AppFonts.urbanistRegular(
                            fontSize: 14.sp,
                            color: AppColors.white500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => controller.navigateToLogin(context),
                          child: Text(
                            'Login',
                            style: AppFonts.urbanistSemiBold(
                              fontSize: 14.sp,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

