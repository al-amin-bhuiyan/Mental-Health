import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../core/custom_assets/custom_assets.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_fonts/app_fonts.dart';
import 'view_full_plan_controller.dart';

class ViewFullPlanPage extends StatelessWidget {
  const ViewFullPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ViewFullPlanController());

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            CustomAssets.onBoardingImage,
            fit: BoxFit.cover,
          ),
          // Dark overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.5),
                  Colors.black.withValues(alpha: 0.8),
                ],
              ),
            ),
          ),
          // Main Content
          SafeArea(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          GoRouter.of(context).pop();
                        },
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
                            size: 18.sp,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'Daily Plan',
                            style: AppFonts.urbanistBold(
                              fontSize: 20.sp,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 40.w),
                    ],
                  ),
                ),
                // Scrollable Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        // Title
                        Text(
                          'Today\'s Devotional Plan',
                          style: AppFonts.urbanistBold(
                            fontSize: 18.sp,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Follow this plan to stay grounded in faith',
                          style: AppFonts.urbanistRegular(
                            fontSize: 13.sp,
                            color: AppColors.white500.withValues(alpha: 0.7),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        // Progress Card
                        _buildProgressCard(controller),
                        SizedBox(height: 20.h),
                        // Task Cards
                        _buildReadingCard(controller),
                        SizedBox(height: 16.h),
                        _buildPrayerCard(controller),
                        SizedBox(height: 16.h),
                        _buildReflectionCard(controller),
                        SizedBox(height: 20.h),
                        // Completion Card (shows when all tasks completed)
                        Obx(() => controller.allTasksCompleted
                            ? _buildCompletionCard()
                            : SizedBox.shrink()),
                        SizedBox(height: 40.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressCard(ViewFullPlanController controller) {
    return Obx(() => Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Color(0xFF3A3A35).withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.1),
              width: 1.w,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Today\'s Progress',
                        style: AppFonts.urbanistMedium(
                          fontSize: 12.sp,
                          color: AppColors.white500.withValues(alpha: 0.7),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        '${controller.completedTasks.value}/3 Tasks',
                        style: AppFonts.urbanistBold(
                          fontSize: 22.sp,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  // Circular Progress Indicator
                  Container(
                    width: 50.w,
                    height: 50.h,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 50.w,
                          height: 50.h,
                          child: CircularProgressIndicator(
                            value: controller.progressPercentage.value / 100,
                            strokeWidth: 4.w,
                            backgroundColor: Colors.white.withValues(alpha: 0.2),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.primaryColor,
                            ),
                          ),
                        ),
                        Text(
                          '${controller.progressPercentage.value}%',
                          style: AppFonts.urbanistBold(
                            fontSize: 12.sp,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              // Progress Bar
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: LinearProgressIndicator(
                  value: controller.progressPercentage.value / 100,
                  backgroundColor: Colors.white.withValues(alpha: 0.2),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.primaryColor,
                  ),
                  minHeight: 8.h,
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildReadingCard(ViewFullPlanController controller) {
    return Obx(() {
      bool isCompleted = controller.readingCompleted.value;
      return Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Color(0xFF2D3E3F).withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isCompleted
                ? Colors.transparent
                : Colors.white.withValues(alpha: 0.1),
            width: isCompleted ? 2.w : 1.w,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isCompleted
                          ? AppColors.primaryColor
                          : Colors.white.withValues(alpha: 0.3),
                      width: 2.w,
                    ),
                    color: isCompleted
                        ? Colors.transparent
                        : Colors.transparent,
                  ),
                  child: isCompleted
                      ? Icon(
                          Icons.check,
                          color: AppColors.primaryColor,
                          size: 16.sp,
                        )
                      : null,
                ),
                SizedBox(width: 12.w),
                Icon(
                  Icons.menu_book,
                  color: AppColors.primaryColor,
                  size: 20.sp,
                ),
                SizedBox(width: 8.w),
                Text(
                  'Reading',
                  style: AppFonts.urbanistBold(
                    fontSize: 16.sp,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.only(left: 36.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Read Psalms 23',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 14.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    '"The Lord is my shepherd, I shall not want. He makes me lie down in green pastures..."',
                    style: AppFonts.urbanistRegular(
                      fontSize: 12.sp,
                      color: AppColors.white500.withValues(alpha: 0.7),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 12.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => controller.toggleReading(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isCompleted
                            ? Color(0xFF3A3A35)
                            : AppColors.primaryColor,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (isCompleted)
                            Icon(
                              Icons.check,
                              color: AppColors.whiteColor,
                              size: 16.sp,
                            ),
                          if (isCompleted) SizedBox(width: 4.w),
                          Text(
                            isCompleted ? 'Completed' : 'Mark as Read',
                            style: AppFonts.urbanistSemiBold(
                              fontSize: 14.sp,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildPrayerCard(ViewFullPlanController controller) {
    return Obx(() {
      bool isCompleted = controller.prayerCompleted.value;
      return Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Color(0xFF2D3E3F).withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isCompleted
                ? Colors.transparent
                : Colors.white.withValues(alpha: 1.1),
            width: isCompleted ? 1.5.w : 1.w,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isCompleted
                          ? AppColors.primaryColor
                          : Colors.white.withValues(alpha: 0.3),
                      width: 2.w,
                    ),
                    color: isCompleted
                        ? Colors.transparent
                        : Colors.transparent,
                  ),
                  child: isCompleted
                      ? Icon(
                          Icons.check,
                          color: AppColors.primaryColor,
                          size: 16.sp,
                        )
                      : null,
                ),
                SizedBox(width: 12.w),
                Text(
                  '🙏',
                  style: TextStyle(fontSize: 18.sp),
                ),
                SizedBox(width: 8.w),
                Text(
                  'Prayer',
                  style: AppFonts.urbanistBold(
                    fontSize: 16.sp,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.only(left: 36.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Spend 5 minutes in prayer',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 14.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'Take time to connect with God. Express gratitude, seek guidance, and find peace in His presence.',
                    style: AppFonts.urbanistRegular(
                      fontSize: 12.sp,
                      color: AppColors.white500.withValues(alpha: 0.7),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 12.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => controller.togglePrayer(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isCompleted
                            ? Color(0xFF3A3A35)
                            : AppColors.primaryColor,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (isCompleted)
                            Icon(
                              Icons.check,
                              color: AppColors.whiteColor,
                              size: 16.sp,
                            ),
                          if (isCompleted) SizedBox(width: 4.w),
                          Text(
                            isCompleted ? 'Completed' : 'Done',
                            style: AppFonts.urbanistSemiBold(
                              fontSize: 14.sp,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildReflectionCard(ViewFullPlanController controller) {
    return Obx(() {
      bool isCompleted = controller.reflectionCompleted.value;
      return Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Color(0xFF2D3E3F).withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(12.r),


        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isCompleted
                          ? AppColors.primaryColor
                          : Colors.white.withValues(alpha: 0.3),
                      width: 2.w,
                    ),
                    color: isCompleted
                        ? Colors.transparent
                        : Colors.transparent,
                  ),
                  child: isCompleted
                      ? Icon(
                          Icons.check,
                          color: AppColors.primaryColor,
                          size: 16.sp,
                        )
                      : null,
                ),
                SizedBox(width: 12.w),
                Text(
                  '✍️',
                  style: TextStyle(fontSize: 18.sp),
                ),
                SizedBox(width: 8.w),
                Text(
                  'Reflection',
                  style: AppFonts.urbanistBold(
                    fontSize: 16.sp,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.only(left: 36.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Write a quick journal entry',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 14.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'Reflect on today\'s reading and how it applies to your life. Capture your thoughts and insights.',
                    style: AppFonts.urbanistRegular(
                      fontSize: 12.sp,
                      color: AppColors.white500.withValues(alpha: 0.7),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 12.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => controller.toggleReflection(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isCompleted
                            ? Color(0xFF3A3A35)
                            : AppColors.primaryColor,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (isCompleted)
                            Icon(
                              Icons.check,
                              color: AppColors.whiteColor,
                              size: 16.sp,
                            ),
                          if (isCompleted) SizedBox(width: 4.w),
                          Text(
                            isCompleted ? 'Completed' : 'Reflect',
                            style: AppFonts.urbanistSemiBold(
                              fontSize: 14.sp,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildCompletionCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(

        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryColor,
          AppColors.blackLightColor,
          ],
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withValues(alpha: 0.3),
            blurRadius: 12.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(CustomAssets.great_work_image,width: 48.h,height: 48.h,),
          SizedBox(height: 12.h),
          Text(
            'Great Work!',
            style: AppFonts.urbanistBold(
              fontSize: 20.sp,
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'You\'ve completed today\'s devotional plan.\nKeep up the spiritual journey!',
            style: AppFonts.urbanistRegular(
              fontSize: 13.sp,
              color: AppColors.white500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

