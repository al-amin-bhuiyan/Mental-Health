import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/custom_assets/custom_assets.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_fonts/app_fonts.dart';
import 'streak_calendar_controller.dart';

class StreakCalendarPage extends StatelessWidget {
  const StreakCalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StreakCalendarController());

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
                            'Streak Calendar',
                            style: AppFonts.urbanistBold(
                              fontSize: 20.sp,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 40.w), // Balance the back button
                    ],
                  ),
                ),
                // Scrollable Calendar Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),
                        // December 2025 Calendar
                        _buildMonthCalendar(
                          'Dec 2025',
                          DateTime(2025, 12, 1),
                          controller,
                        ),
                        SizedBox(height: 30.h),
                        // January 2026 Calendar
                        _buildMonthCalendar(
                          'Jan 2026',
                          DateTime(2026, 1, 1),
                          controller,
                        ),
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

  Widget _buildMonthCalendar(String monthYear, DateTime firstDayOfMonth, StreakCalendarController controller) {
    final daysInMonth = DateTime(firstDayOfMonth.year, firstDayOfMonth.month + 1, 0).day;
    final firstWeekday = firstDayOfMonth.weekday % 7; // 0 = Monday, 6 = Sunday

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Color(0xFF4A4A4A).withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          // Month/Year Header
          Text(
            monthYear,
            style: AppFonts.urbanistBold(
              fontSize: 18.sp,
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(height: 20.h),
          // Weekday Headers
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'].map((day) {
              return SizedBox(
                width: 38.w,
                child: Center(
                  child: Text(
                    day,
                    style: AppFonts.urbanistMedium(
                      fontSize: 10.sp,
                      color: AppColors.white500.withValues(alpha: 0.7),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 16.h),
          // Calendar Grid
          _buildCalendarGrid(firstDayOfMonth, daysInMonth, firstWeekday, controller),
        ],
      ),
    );
  }

  Widget _buildCalendarGrid(DateTime firstDay, int daysInMonth, int firstWeekday, StreakCalendarController controller) {
    List<Widget> weeks = [];
    List<Widget> currentWeek = [];

    // Add empty spaces for days before the first day of month
    for (int i = 0; i < firstWeekday; i++) {
      currentWeek.add(_buildEmptyDay());
    }

    // Add all days of the month
    for (int day = 1; day <= daysInMonth; day++) {
      final date = DateTime(firstDay.year, firstDay.month, day);
      final hasStreak = controller.hasStreakOnDate(date);

      currentWeek.add(_buildDayCircle(day, hasStreak));

      // Start new week after Sunday
      if ((firstWeekday + day) % 7 == 0 || day == daysInMonth) {
        weeks.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.from(currentWeek),
        ));
        weeks.add(SizedBox(height: 12.h));
        currentWeek.clear();
      }
    }

    return Column(children: weeks);
  }

  Widget _buildEmptyDay() {
    return SizedBox(
      width: 38.w,
      height: 38.h,
    );
  }

  Widget _buildDayCircle(int day, bool hasStreak) {
    return Container(
      width: 38.w,
      height: 38.h,
      decoration: BoxDecoration(
        color: hasStreak
            ? AppColors.primaryColor
            : Color(0xFF5A5A5A).withValues(alpha: 0.6),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: hasStreak
            ? Text(
                '🔥',
                style: TextStyle(fontSize: 18.sp),
              )
            : Text(
                '$day',
                style: AppFonts.urbanistMedium(
                  fontSize: 13.sp,
                  color: AppColors.white500,
                ),
              ),
      ),
    );
  }
}

