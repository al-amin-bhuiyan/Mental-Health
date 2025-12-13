import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../core/custom_assets/custom_assets.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_fonts/app_fonts.dart';
import 'notification_controller.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationController controller = Get.put(NotificationController());

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
                          'Notification',
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

              // Notifications List
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Today Section
                      if (controller.todayNotifications.isNotEmpty) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'TODAY',
                              style: AppFonts.urbanistBold(
                                fontSize: 14.sp,
                                color: AppColors.whiteColor,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => controller.markAllAsRead(),
                              child: Text(
                                'Mark all as read',
                                style: AppFonts.urbanistSemiBold(
                                  fontSize: 12.sp,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),

                        // Today Notifications
                        ...controller.todayNotifications.map((notification) {
                          return _buildNotificationItem(
                            notification: notification,
                            onTap: () => controller.markAsRead(notification.id),
                          );
                        }).toList(),

                        SizedBox(height: 24.h),
                      ],

                      // Yesterday Section
                      if (controller.yesterdayNotifications.isNotEmpty) ...[
                        Text(
                          'Yesterday',
                          style: AppFonts.urbanistBold(
                            fontSize: 14.sp,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        SizedBox(height: 16.h),

                        // Yesterday Notifications
                        ...controller.yesterdayNotifications.map((notification) {
                          return _buildNotificationItem(
                            notification: notification,
                            onTap: () => controller.markAsRead(notification.id),
                          );
                        }).toList(),

                        SizedBox(height: 24.h),
                      ],
                    ],
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationItem({
    required NotificationItem notification,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Notification Icon
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.notifications,
                color: AppColors.primaryColor,
                size: 20.sp,
              ),
            ),

            SizedBox(width: 12.w),

            // Notification Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title,
                    style: AppFonts.urbanistMedium(
                      fontSize: 13.sp,
                      color: AppColors.whiteColor,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    notification.time,
                    style: AppFonts.urbanistRegular(
                      fontSize: 11.sp,
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
}

