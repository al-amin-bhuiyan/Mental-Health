import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/custom_assets/custom_assets.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_fonts/app_fonts.dart';
import '../../utils/nav_bar/nav_bar.dart';
import 'streak_calendar/streak_calendar.dart';
import 'view_full_plan/view_full_plan.dart';
import 'home_page_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());

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
                  Colors.black.withValues(alpha: 0.3),
                  Colors.black.withValues(alpha: 0.7),
                ],
              ),
            ),
          ),
          // Main Content
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16.h),
                        // Greeting Section
                        _buildGreetingSection(context),
                        SizedBox(height: 20.h),
                        // Calendar Week View
                        _buildCalendarWeek(),
                        SizedBox(height: 20.h),
                        // Verse of the Day
                        _buildVerseOfTheDay(),
                        SizedBox(height: 20.h),
                        // Mood Tracker
                        _buildMoodTracker(),
                        SizedBox(height: 20.h),
                        // Today's Plan
                        _buildTodaysPlan(context),
                        SizedBox(height: 100.h), // Space for nav bar
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }

  Widget _buildGreetingSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'Hey, Anthony!',
              style: AppFonts.urbanistBold(
                fontSize: 20.sp,
                color: AppColors.whiteColor,
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              '👋',
              style: TextStyle(fontSize: 20.sp),
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StreakCalendarPage(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    Text(
                      'Sun 5 dec',
                      style: AppFonts.urbanistMedium(
                        fontSize: 12.sp,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Icon(Icons.calendar_today, size: 12.sp, color: AppColors.primaryColor),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.primaryColor, width: 1.w),
              ),
              child: Row(
                children: [
                  Text(
                    '🔥',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    '5',
                    style: AppFonts.urbanistBold(
                      fontSize: 12.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCalendarWeek() {
    final days = ['Sat', 'Sun', 'Mon', 'Tue', 'Tue', 'Thu', 'Fri'];
    final dates = ['1', '2', '3', '4', '5', '6', '7'];
    final emojis = ['😴', '😊', '😐', '😔', '😡', '', ''];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(7, (index) {
        final isSelected = index == 4; // Tuesday 5 is selected
        return Column(
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primaryColor
                    : Colors.white.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  dates[index],
                  style: AppFonts.urbanistSemiBold(
                    fontSize: 16.sp,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              days[index],
              style: AppFonts.urbanistMedium(
                fontSize: 12.sp,
                color: AppColors.white500,
              ),
            ),
            SizedBox(height: 8.h),
            if (emojis[index].isNotEmpty)
              Container(
                width: 36.w,
                height: 36.h,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    emojis[index],
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ),
              ),
          ],
        );
      }),
    );
  }

  Widget _buildVerseOfTheDay() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.4),
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
            children: [
              Icon(Icons.menu_book, color: AppColors.primaryColor, size: 18.sp),
              SizedBox(width: 8.w),
              Text(
                'Verse of the Day',
                style: AppFonts.urbanistSemiBold(
                  fontSize: 16.sp,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            '"For I know the plans I have for you, declares the Lord, plans to prosper you and not to harm you, plans to give you hope and a future."',
            style: AppFonts.urbanistMedium(
              fontSize: 14.sp,
              color: AppColors.whiteColor,
              height: 1.5,
            ),
          ),
          SizedBox(height: 8.h),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '— Jeremiah 29:11',
              style: AppFonts.urbanistMedium(
                fontSize: 12.sp,
                color: AppColors.white500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMoodTracker() {
    final moods = [
      {'emoji': '😊', 'label': 'Happy'},
      {'emoji': '😟', 'label': 'Anxious'},
      {'emoji': '😌', 'label': 'Calm'},
      {'emoji': '😠', 'label': 'Angry'},
      {'emoji': '😄', 'label': 'Joyful'},
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.4),
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
            children: [
              Text(
                '😊',
                style: TextStyle(fontSize: 18.sp),
              ),
              SizedBox(width: 8.w),
              Text(
                'How Are You Feeling?',
                style: AppFonts.urbanistSemiBold(
                  fontSize: 16.sp,
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: moods.map((mood) {
              return Column(
                children: [
                  Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        mood['emoji']!,
                        style: TextStyle(fontSize: 24.sp),
                      ),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    mood['label']!,
                    style: AppFonts.urbanistMedium(
                      fontSize: 10.sp,
                      color: AppColors.white500,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                'Log Mood',
                style: AppFonts.urbanistSemiBold(
                  fontSize: 14.sp,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTodaysPlan(BuildContext context) {
    final plans = [
      {'icon': Icons.menu_book, 'title': 'Reading', 'time': '30 min', 'status': 'Mark as Read'},
      {'icon': Icons.church, 'title': 'Prayer', 'time': '5 minutes', 'status': 'Done'},
      {'icon': Icons.edit_note, 'title': 'Reflection', 'time': 'Journal entry', 'status': 'Reflect'},
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.4),
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
              Row(
                children: [
                  Icon(Icons.calendar_today, color: AppColors.primaryColor, size: 18.sp),
                  SizedBox(width: 8.w),
                  Text(
                    'Today\'s Plan',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 16.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  '🔥',
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          ...plans.map((plan) => _buildPlanItem(
                plan['icon'] as IconData,
                plan['title'] as String,
                plan['time'] as String,
                plan['status'] as String,
              )),
          SizedBox(height: 12.h),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ViewFullPlanPage(),
                  ),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'View Full Plan',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 14.sp,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Icon(Icons.arrow_forward_ios, size: 12.sp, color: AppColors.primaryColor),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanItem(IconData icon, String title, String time, String status) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.white500, size: 20.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppFonts.urbanistSemiBold(
                    fontSize: 14.sp,
                    color: AppColors.whiteColor,
                  ),
                ),
                Text(
                  time,
                  style: AppFonts.urbanistRegular(
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
              color: status == 'Done'
                  ? Colors.green.withValues(alpha: 0.2)
                  : AppColors.primaryColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: status == 'Done' ? Colors.green : AppColors.primaryColor,
                width: 1.w,
              ),
            ),
            child: Text(
              status,
              style: AppFonts.urbanistMedium(
                fontSize: 11.sp,
                color: status == 'Done' ? Colors.green : AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

