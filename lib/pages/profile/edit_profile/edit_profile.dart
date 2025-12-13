import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../core/custom_assets/custom_assets.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_fonts/app_fonts.dart';
import 'edit_profile_controller.dart';

class EditProfilePage extends StatelessWidget {
  final String userName;

  const EditProfilePage({
    super.key,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    // Get or create controller
    final EditProfileController controller = Get.put(
      EditProfileController(),
      tag: userName, // Use tag to avoid conflicts
    );

    // Initialize controller with user data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.initializeData(userName);
    });

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
                          'Edit Profile',
                          style: AppFonts.urbanistBold(
                            fontSize: 24.sp,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 40.w), // For centering
                  ],
                ),
              ),

              // Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Container(
                    margin: EdgeInsets.only(top: 20.h),
                    padding: EdgeInsets.all(24.w),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      children: [
                        // Profile Picture
                        Obx(() => Stack(
                          children: [
                            Container(
                              width: 100.w,
                              height: 100.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                  width: 3.w,
                                ),
                              ),
                              child: ClipOval(
                                child: controller.profileImageUrl.value.isEmpty
                                    ? Container(
                                        color: AppColors.whiteColor.withValues(alpha: 0.3),
                                        child: Icon(
                                          Icons.person,
                                          color: AppColors.whiteColor,
                                          size: 50.sp,
                                        ),
                                      )
                                    : Image.network(
                                        controller.profileImageUrl.value,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () => controller.changeProfilePicture(),
                                child: Container(
                                  width: 32.w,
                                  height: 32.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.whiteColor,
                                      width: 2.w,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: AppColors.whiteColor,
                                    size: 18.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),

                        SizedBox(height: 12.h),

                        Text(
                          'Change Your Profile Picture',
                          style: AppFonts.urbanistMedium(
                            fontSize: 14.sp,
                            color: AppColors.whiteColor,
                          ),
                        ),

                        SizedBox(height: 32.h),

                        // Name Field
                        _buildTextField(
                          label: 'Name',
                          controller: controller.nameController,
                          hintText: 'Enter your name',
                        ),

                        SizedBox(height: 20.h),

                        // Email Field
                        _buildTextField(
                          label: 'Email',
                          controller: controller.emailController,
                          hintText: 'Enter your email',
                          keyboardType: TextInputType.emailAddress,
                        ),

                        SizedBox(height: 20.h),

                        // Location Field
                        _buildTextField(
                          label: 'Location',
                          controller: controller.locationController,
                          hintText: 'Enter your location',
                        ),

                        SizedBox(height: 40.h),

                        // Save Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => controller.saveProfile(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              padding: EdgeInsets.symmetric(vertical: 16.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            child: Text(
                              'Save',
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppFonts.urbanistMedium(
            fontSize: 14.sp,
            color: AppColors.whiteColor,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: Color(0xFF4A7C8C),
              width: 1.5.w,
            ),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            style: AppFonts.urbanistRegular(
              fontSize: 14.sp,
              color: AppColors.whiteColor,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppFonts.urbanistRegular(
                fontSize: 14.sp,
                color: AppColors.grayColor,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 14.h,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}

