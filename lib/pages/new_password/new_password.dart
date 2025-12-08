import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../core/custom_assets/custom_assets.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_fonts/app_fonts.dart';
import 'new_password_controller.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewPasswordController());

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
                  SizedBox(height: 20.h),
                  // Back button
                  Container(
                    width: 44.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () => context.pop(),
                      icon: SvgPicture.asset(
                        CustomAssets.back_arrow_icon,
                        width: 20.w,
                        height: 20.h,
                        colorFilter: ColorFilter.mode(
                          AppColors.whiteColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  SizedBox(height: 80.h),
                  // Title
                  Center(
                    child: Text(
                      'New password',
                      style: AppFonts.urbanistSemiBold(
                        fontSize: 32.sp,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  // Subtitle
                  Center(
                    child: Text(
                      'New password must different from previous',
                      style: AppFonts.urbanistRegular(
                        fontSize: 14.sp,
                        color: AppColors.white500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  // New Password Field Label
                  Text(
                    'New Password',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 14.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  // New Password Field
                  Obx(
                    () => TextField(
                      controller: controller.newPasswordController,
                      obscureText: controller.isNewPasswordHidden.value,
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
                            controller.isNewPasswordHidden.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: AppColors.white500,
                          ),
                          onPressed: controller.toggleNewPasswordVisibility,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  // Update Password Field Label
                  Text(
                    'Update Password',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 14.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  // Update Password Field
                  Obx(
                    () => TextField(
                      controller: controller.updatePasswordController,
                      obscureText: controller.isUpdatePasswordHidden.value,
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
                            controller.isUpdatePasswordHidden.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: AppColors.white500,
                          ),
                          onPressed: controller.toggleUpdatePasswordVisibility,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  // Change Password Button
                  SizedBox(
                    width: double.infinity,
                    height: 56.h,
                    child: ElevatedButton(
                      onPressed: () => controller.changePassword(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Change Password',
                        style: AppFonts.urbanistSemiBold(
                          fontSize: 16.sp,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

