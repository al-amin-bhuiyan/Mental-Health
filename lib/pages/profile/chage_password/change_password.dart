import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../core/custom_assets/custom_assets.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_fonts/app_fonts.dart';
import 'change_password_controller.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ChangePasswordController controller = Get.put(ChangePasswordController());

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(CustomAssets.onBoardingImage),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // App Bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColors.whiteColor,
                          size: 20.sp,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Change Password',
                          style: AppFonts.urbanistBold(
                            fontSize: 20.sp,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 40.w), // For centering
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              // Form Section
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Current Password
                      Text(
                        'Current Password',
                        style: AppFonts.urbanistMedium(
                          fontSize: 14.sp,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Obx(() => Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.3),
                            width: 1.w,
                          ),
                        ),
                        child: TextField(
                          controller: controller.currentPasswordController,
                          obscureText: !controller.isCurrentPasswordVisible.value,
                          style: AppFonts.urbanistRegular(
                            fontSize: 14.sp,
                            color: AppColors.whiteColor,
                          ),
                          decoration: InputDecoration(
                            hintText: '••••••',
                            hintStyle: AppFonts.urbanistRegular(
                              fontSize: 16.sp,
                              color: AppColors.whiteColor,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 14.h,
                            ),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isCurrentPasswordVisible.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppColors.whiteColor,
                                size: 20.sp,
                              ),
                              onPressed: controller.toggleCurrentPasswordVisibility,
                            ),
                          ),
                        ),
                      )),

                      SizedBox(height: 20.h),

                      // New Password
                      Text(
                        'New Password',
                        style: AppFonts.urbanistMedium(
                          fontSize: 14.sp,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Obx(() => Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.3),
                            width: 1.w,
                          ),
                        ),
                        child: TextField(
                          controller: controller.newPasswordController,
                          obscureText: !controller.isNewPasswordVisible.value,
                          style: AppFonts.urbanistRegular(
                            fontSize: 14.sp,
                            color: AppColors.whiteColor,
                          ),
                          decoration: InputDecoration(
                            hintText: '••••••',
                            hintStyle: AppFonts.urbanistRegular(
                              fontSize: 16.sp,
                              color: AppColors.whiteColor,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 14.h,
                            ),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isNewPasswordVisible.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppColors.whiteColor,
                                size: 20.sp,
                              ),
                              onPressed: controller.toggleNewPasswordVisibility,
                            ),
                          ),
                        ),
                      )),

                      SizedBox(height: 20.h),

                      // Confirm Password
                      Text(
                        'Confirm Password',
                        style: AppFonts.urbanistMedium(
                          fontSize: 14.sp,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Obx(() => Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.3),
                            width: 1.w,
                          ),
                        ),
                        child: TextField(
                          controller: controller.confirmPasswordController,
                          obscureText: !controller.isConfirmPasswordVisible.value,
                          style: AppFonts.urbanistRegular(
                            fontSize: 14.sp,
                            color: AppColors.whiteColor,
                          ),
                          decoration: InputDecoration(
                            hintText: '••••••',
                            hintStyle: AppFonts.urbanistRegular(
                              fontSize: 16.sp,
                              color: AppColors.whiteColor,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 14.h,
                            ),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isConfirmPasswordVisible.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppColors.whiteColor,
                                size: 20.sp,
                              ),
                              onPressed: controller.toggleConfirmPasswordVisibility,
                            ),
                          ),
                        ),
                      )),

                      SizedBox(height: 40.h),

                      // Update Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => controller.updatePassword(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          child: Text(
                            'Update',
                            style: AppFonts.urbanistBold(
                              fontSize: 16.sp,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

