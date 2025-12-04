import 'package:flutter/material.dart';
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
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  // Back button
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () => context.pop(),
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColors.whiteColor,
                        size: 20,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  const SizedBox(height: 80),
                  // Title
                  Center(
                    child: Text(
                      'New password',
                      style: AppFonts.urbanistSemiBold(
                        fontSize: 32,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Subtitle
                  Center(
                    child: Text(
                      'New password must different from previous',
                      style: AppFonts.urbanistRegular(
                        fontSize: 14,
                        color: AppColors.white500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // New Password Field Label
                  Text(
                    'New Password',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 14,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // New Password Field
                  Obx(
                    () => TextField(
                      controller: controller.newPasswordController,
                      obscureText: controller.isNewPasswordHidden.value,
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
                  const SizedBox(height: 24),
                  // Update Password Field Label
                  Text(
                    'Update Password',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 14,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Update Password Field
                  Obx(
                    () => TextField(
                      controller: controller.updatePasswordController,
                      obscureText: controller.isUpdatePasswordHidden.value,
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
                  const SizedBox(height: 40),
                  // Change Password Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () => controller.changePassword(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Change Password',
                        style: AppFonts.urbanistSemiBold(
                          fontSize: 16,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

