import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../core/custom_assets/custom_assets.dart';
import '../../../core/app_route/app_path.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_fonts/app_fonts.dart';
import '../../../utils/nav_bar/nav_bar.dart';
import 'profile_page_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfilePageController controller = Get.put(ProfilePageController());

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
                child: Text(
                  'Profile',
                  style: AppFonts.urbanistBold(
                    fontSize: 24.sp,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),

              // Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      SizedBox(height: 8.h),

                      // Profile Card
                      _buildProfileCard(controller, context),

                      SizedBox(height: 16.h),

                      // Upgrade Plan Card
                      _buildUpgradePlanCard(controller, context),

                      SizedBox(height: 24.h),

                      // Settings Header
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Settings',
                          style: AppFonts.urbanistBold(
                            fontSize: 18.sp,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),

                      SizedBox(height: 16.h),

                      // Settings Items
                      _buildSettingsItem(
                        icon: CustomAssets.change_password,
                        title: 'Change Password',
                        onTap: () => context.push(AppPath.changePassword),
                      ),

                      SizedBox(height: 12.h),

                      _buildSettingsItem(
                        icon: CustomAssets.notification,
                        title: 'Notifications',
                        onTap: () => context.push(AppPath.notification),
                      ),

                      SizedBox(height: 12.h),

                      _buildSettingsItem(
                        icon: CustomAssets.bible_version,
                        title: 'Bible Version',
                        onTap: () =>  context.push(AppPath.bibleVersion),
                      ),

                      SizedBox(height: 12.h),

                      _buildSettingsItem(
                        icon: CustomAssets.manage_subscription,
                        title: 'Manage Subscription',
                        onTap: () => context.push(AppPath.manageSubscription),
                      ),

                      SizedBox(height: 12.h),

                      _buildSettingsItem(
                        icon: CustomAssets.language,
                        title: 'language',
                        onTap: () => context.push(AppPath.language),
                      ),

                      SizedBox(height: 12.h),

                      _buildSettingsItem(
                        icon: CustomAssets.about_use,
                        title: 'About Us',
                        onTap: () => context.push(AppPath.aboutus),
                      ),

                      SizedBox(height: 12.h),

                      _buildSettingsItem(
                        icon: CustomAssets.privacy_policy,
                        title: 'Privacy policy',
                        onTap: () => context.push(AppPath.privacypolicy),
                      ),

                      SizedBox(height: 12.h),

                      _buildSettingsItem(
                        icon: CustomAssets.terms_and_condition,
                        title: 'Terms & Conditions',
                        onTap: () => context.push(AppPath.termsandcondition),
                      ),

                      SizedBox(height: 12.h),

                      _buildSettingsItem(
                        icon: CustomAssets.logout,
                        title: 'Logout',
                        onTap: () => _showLogoutDialog(context),
                      ),

                      SizedBox(height: 100.h), // Extra space for nav bar
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }

  // Replaced Get.defaultDialog with Flutter's showDialog to avoid navigation/library overlap issues.
  // Uses Navigator.of(context).pop() to close the dialog reliably.
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors
          .transparent, // << add this so the BackdropFilter can blur the background

      builder: (dialogContext) {
        return BackdropFilter( // << wrap AlertDialog with BackdropFilter
          filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
          child: Container(
            // optional dim so it still looks like a modal overlay
            color: Colors.black.withValues(alpha: 0.35),
            child: AlertDialog(
              backgroundColor: Colors.black.withValues(alpha: 0.9),
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
              content: Text(
                'Do you want to logout from your profile?',
                style: AppFonts.urbanistMedium(
                  fontSize: 14.sp,
                  color: AppColors.grayColor,
                ),
              ),
              actionsPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                  },
                  style: TextButton.styleFrom(
                    padding:
                    EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    backgroundColor:
                    AppColors.blackLightColor.withValues(alpha: 0.4),
                    side:
                    BorderSide(color: AppColors.primaryColor, width: 2.w),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r)),
                  ),
                  child: Text(
                    'No',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 16.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                    _logout(context);
                  },
                  style: TextButton.styleFrom(
                    padding:
                    EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    backgroundColor: AppColors.primaryColor,
                    side:
                    BorderSide(color: AppColors.primaryColor, width: 1.w),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r)),
                  ),
                  child: Text(
                    'Yes',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 16.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Keep logout logic centralized here. Do actual clearing/navigating from here.
  // The function accepts BuildContext so you can use either Navigator/GoRouter if needed.
  void _logout(BuildContext context) {
    // Example logout steps:
    // 1. Clear any user/session data (e.g., via controller or storage)
    //    final controller = Get.find<ProfilePageController>();
    //    controller.clearSession(); // implement in controller if needed
    //
    // 2. Navigate to the login/onboarding screen. Uncomment and change to the correct route.
    //    // Using GoRouter:
    //    // context.go(AppPath.login);
    //    // Using Get:
    //    // Get.offAllNamed(AppPath.login);
    //
    // 3. Show confirmation to the user.
    Get.snackbar(
      'Logged out',
      'You have been logged out',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black.withValues(alpha: 0.8),
      colorText: AppColors.whiteColor,
    );
  }

  Widget _buildProfileCard(ProfilePageController controller, BuildContext context) {
    return Obx(
          () => GestureDetector(
        onTap: () {
          // Navigate to edit profile page with userName
          context.push(
            AppPath.editProfile,
            extra: {
              'userName': controller.userName.value,
            },
          );
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Color(0xFF424242).withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            children: [
              // Profile Image
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primaryColor,
                    width: 2.w,
                  ),
                ),
                child: ClipOval(
                  child: controller.userProfileImage.value.isEmpty
                      ? Container(
                    color: AppColors.primaryColor.withValues(alpha: 0.3),
                    child: Icon(
                      Icons.person,
                      color: AppColors.whiteColor,
                      size: 30.sp,
                    ),
                  )
                      : Image.network(
                    controller.userProfileImage.value,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(width: 12.w),

              // Name
              Expanded(
                child: Text(
                  controller.userName.value,
                  style: AppFonts.urbanistBold(
                    fontSize: 18.sp,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),

              // Arrow Icon
              Icon(
                Icons.chevron_right,
                color: AppColors.whiteColor,
                size: 24.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUpgradePlanCard(ProfilePageController controller, BuildContext context) {
    return GestureDetector(
      onTap: () => controller.navigateToUpgradePlan(context),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: AppColors.primaryColor.withValues(alpha: 0.3),
            width: 1.w,
          ),
        ),
        child: Row(
          children: [
            // Premium Icon
            SvgPicture.asset(
              CustomAssets.premimum_icon,
              width: 50.w,
              height: 50.h,
            ),

            SizedBox(width: 14.w),

            // Text Content
            Expanded(
              child: ElevatedButton(
                onPressed: () => context.push(AppPath.manageSubscription),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Upgrade Plan Now!',
                      style: AppFonts.urbanistBold(
                        fontSize: 16.sp,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Enjoy all the benefits and explore more',
                      style: AppFonts.urbanistMedium(
                        fontSize: 12.sp,
                        color: AppColors.grayColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required String icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Color(0xFF3A3A35).withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            // Icon
            SvgPicture.asset(
              icon,
              width: 20.w,
              height: 20.h,
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),

            SizedBox(width: 12.w),

            // Title
            Expanded(
              child: Text(
                title,
                style: AppFonts.urbanistSemiBold(
                  fontSize: 14.sp,
                  color: AppColors.whiteColor,
                ),
              ),
            ),

            // Arrow Icon
            Icon(
              Icons.chevron_right,
              color: AppColors.whiteColor,
              size: 20.sp,
            ),
          ],
        ),
      ),
    );
  }
}