import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
          // Dark gradient overlay
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
                        onTap: () => Navigator.pop(context),
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
                            'Today\'s Full Plan',
                            style: AppFonts.urbanistBold(
                              fontSize: 20.sp,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 40.w), // Balance
                    ],
                  ),
                ),
                // Progress Section
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Obx(() => _buildProgressCard(controller)),
                ),
                SizedBox(height: 20.h),
                // Plans List
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      itemCount: controller.plans.length,
                      itemBuilder: (context, index) {
                        final plan = controller.plans[index];
                        return _buildPlanCard(
                          context,
                          plan,
                          index,
                          controller,
                        );
                      },
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
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
          width: 1.w,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Daily Progress',
                style: AppFonts.urbanistBold(
                  fontSize: 18.sp,
                  color: AppColors.whiteColor,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: AppColors.primaryColor,
                    width: 1.w,
                  ),
                ),
                child: Text(
                  '${controller.completedCount}/${controller.totalCount}',
                  style: AppFonts.urbanistBold(
                    fontSize: 14.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: LinearProgressIndicator(
              value: controller.progressPercentage,
              backgroundColor: Colors.white.withValues(alpha: 0.2),
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
              minHeight: 8.h,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            '${(controller.progressPercentage * 100).toStringAsFixed(0)}% Complete',
            style: AppFonts.urbanistMedium(
              fontSize: 14.sp,
              color: AppColors.white500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanCard(
    BuildContext context,
    Map<String, dynamic> plan,
    int index,
    ViewFullPlanController controller,
  ) {
    final status = plan['status'] as String;
    final isDone = status == 'Done';
    final isInProgress = status == 'In Progress';
    final isUpcoming = status == 'Upcoming';

    Color statusColor = AppColors.primaryColor;
    Color bgColor = AppColors.primaryColor.withValues(alpha: 0.2);

    if (isDone) {
      statusColor = Colors.green;
      bgColor = Colors.green.withValues(alpha: 0.2);
    } else if (isInProgress) {
      statusColor = Colors.blue;
      bgColor = Colors.blue.withValues(alpha: 0.2);
    }

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isDone
              ? Colors.green.withValues(alpha: 0.3)
              : Colors.white.withValues(alpha: 0.1),
          width: 1.w,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  _getIconData(plan['icon'] as String),
                  color: statusColor,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      plan['title'] as String,
                      style: AppFonts.urbanistBold(
                        fontSize: 16.sp,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      plan['time'] as String,
                      style: AppFonts.urbanistMedium(
                        fontSize: 12.sp,
                        color: AppColors.white500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: statusColor,
                    width: 1.w,
                  ),
                ),
                child: Text(
                  status,
                  style: AppFonts.urbanistMedium(
                    fontSize: 11.sp,
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            plan['description'] as String,
            style: AppFonts.urbanistRegular(
              fontSize: 13.sp,
              color: AppColors.white500,
              height: 1.4,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Icon(
                Icons.access_time,
                color: AppColors.primaryColor,
                size: 16.sp,
              ),
              SizedBox(width: 6.w),
              Text(
                plan['duration'] as String,
                style: AppFonts.urbanistMedium(
                  fontSize: 12.sp,
                  color: AppColors.primaryColor,
                ),
              ),
              Spacer(),
              if (!isDone)
                TextButton(
                  onPressed: () {
                    if (isUpcoming) {
                      controller.markAsInProgress(index);
                    } else if (isInProgress) {
                      controller.markAsDone(index);
                    }
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    backgroundColor: AppColors.primaryColor.withValues(alpha: 0.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      side: BorderSide(color: AppColors.primaryColor, width: 1.w),
                    ),
                  ),
                  child: Text(
                    isUpcoming ? 'Start' : 'Complete',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 12.sp,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              if (isDone)
                Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green, size: 20.sp),
                    SizedBox(width: 6.w),
                    Text(
                      'Completed',
                      style: AppFonts.urbanistMedium(
                        fontSize: 12.sp,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'menu_book':
        return Icons.menu_book;
      case 'church':
        return Icons.church;
      case 'fitness_center':
        return Icons.fitness_center;
      case 'book':
        return Icons.book;
      case 'edit_note':
        return Icons.edit_note;
      case 'bedtime':
        return Icons.bedtime;
      default:
        return Icons.task_alt;
    }
  }
}

