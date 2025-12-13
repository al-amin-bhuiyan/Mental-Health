import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../core/custom_assets/custom_assets.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_fonts/app_fonts.dart';
import 'bible_version_controller.dart';

class BibleVersionPage extends StatelessWidget {
  const BibleVersionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final BibleVersionController controller = Get.put(BibleVersionController());

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
                          'Bible Version',
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

              // Bible Versions List
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Obx(() => Column(
                    children: controller.bibleVersions.map((version) {
                      return _buildVersionItem(
                        version: version.name,
                        isSelected: controller.isSelected(version.name),
                        onTap: () => controller.selectVersion(version.name, context),
                      );
                    }).toList(),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVersionItem({
    required String version,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.2),
            width: 1.w,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                version,
                style: AppFonts.urbanistMedium(
                  fontSize: 15.sp,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            Container(
              width: 24.w,
              height: 24.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColors.whiteColor
                      : Colors.white.withValues(alpha: 0.5),
                  width: 2.w,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 12.w,
                        height: 12.h,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

