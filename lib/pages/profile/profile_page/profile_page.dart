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
                        title: 'Language',
                        onTap: () => controller.navigateToLanguage(context),
                      ),

                      SizedBox(height: 12.h),

                      _buildSettingsItem(
                        icon: CustomAssets.about_use,
                        title: 'About Us',
                        onTap: () => controller.navigateToAboutUs(context),
                      ),

                      SizedBox(height: 12.h),

                      _buildSettingsItem(
                        icon: CustomAssets.privacy_policy,
                        title: 'Privacy policy',
                        onTap: () => controller.navigateToPrivacyPolicy(context),
                      ),

                      SizedBox(height: 12.h),

                      _buildSettingsItem(
                        icon: CustomAssets.terms_and_condition,
                        title: 'Terms & Conditions',
                        onTap: () => controller.navigateToTermsAndConditions(context),
                      ),

                      SizedBox(height: 12.h),

                      _buildSettingsItem(
                        icon: CustomAssets.logout,
                        title: 'Logout',
                        onTap: () => controller.logout(context),
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

