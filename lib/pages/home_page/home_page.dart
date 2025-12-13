import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../core/custom_assets/custom_assets.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_fonts/app_fonts.dart';
import '../../utils/nav_bar/nav_bar.dart';
import 'view_full_plan/view_full_plan.dart';
import 'home_page_controller.dart';
import 'streak_calendar/streak_calendar_controller.dart';
import 'log_mood/log_mood.dart';

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
          Image.asset(CustomAssets.home_background_image, fit: BoxFit.cover),
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
                        _buildMoodTracker(context),
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
            Text('👋', style: TextStyle(fontSize: 20.sp)),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => _buildStreakCalendar(context),
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
                    Icon(
                      Icons.calendar_today,
                      size: 12.sp,
                      color: AppColors.primaryColor,
                    ),
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
                  Text('🔥', style: TextStyle(fontSize: 12.sp)),
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
    // Full month calendar - 30 days
    final dayNames = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final days = List.generate(30, (index) => dayNames[index % 7]);
    final dates = List.generate(30, (index) => (index + 1).toString());

    // Generate emojis for 30 days (cycling through available moods)
    final emojisList = [
      CustomAssets.happy_icon,
      CustomAssets.calm_icon,
      CustomAssets.happy_icon,
      CustomAssets.awful_icon,
      CustomAssets.happy_icon,
      CustomAssets.angry_icon,
      CustomAssets.anxious_icon,
    ];
    final emojis = List.generate(
      30,
      (index) => emojisList[index % emojisList.length],
    );

    return SizedBox(
      height: 110.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 30,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final isSelected = index == 4; // 5th day is selected
          return Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Column(
              children: [
                // Combined day name and date in same circle
                Container(
                  width: 48.w,
                  height: 60.h,

                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primaryColor.withValues(
                            alpha: 0.2,
                          ) // background color when selected
                        : Colors
                              .transparent, // background color when not selected
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(25.h),
                    border: isSelected
                        ? Border.all(
                            color: AppColors.primaryColor,
                            width: 1.0.w,
                          )
                        : Border.all(width: 0.5.w),
                  ),

                  child: Container(
                    decoration: BoxDecoration(
                      //   color: Color(0xFF4A5B5D),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(25.h),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          days[index],
                          style: AppFonts.urbanistSemiBold(
                            fontSize: 11.sp,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        Text(
                          dates[index],
                          style: AppFonts.urbanistBold(
                            fontSize: 18.sp,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                // Emoji icon with border for selected
                Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: isSelected
                        ? Border.all(color: AppColors.primaryColor, width: 1.w)
                        : null,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF6B5B5A),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.w),
                      child: SvgPicture.asset(
                        width: 20.w,
                        height: 20.h,
                        emojis[index],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
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
        image: DecorationImage(
          image: AssetImage(CustomAssets.verse_of_the_day_background),
          fit: BoxFit.cover,
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

  Widget _buildMoodTracker(BuildContext context) {
    final moods = [
      {'icon': CustomAssets.happy_icon, 'label': 'Happy'},
      {'icon': CustomAssets.anxious_icon, 'label': 'Anxious'},
      {'icon': CustomAssets.calm_icon, 'label': 'Calm'},
      {'icon': CustomAssets.angry_icon, 'label': 'Angry'},
      {'icon': CustomAssets.awful_icon, 'label': 'Awful'},
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(17.r),
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
              SvgPicture.asset(
                CustomAssets.how_are_you_feeling,
                width: 16.w,
                height: 16.h,
              ),
              SizedBox(width: 8.w),
              Text(
                'How Are You Feeling?',
                style: AppFonts.urbanistSemiBold(
                  fontSize: 12.sp,
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),

          // Fixed row with all moods
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: moods.map((mood) {
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Container(
                    height: 57.h,
                    width: 57.w,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          mood['icon']!,
                          width: 16.w,
                          height: 16.h,
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          mood['label']!,
                          style: AppFonts.urbanistMedium(
                            fontSize: 9.sp,
                            color: AppColors.white500,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),

          SizedBox(height: 16.h),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LogMoodPage(),
                  ),
                );
              },
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
      {
        'icon': Icons.menu_book,
        'title': 'Reading',
        'subtitle': 'Bible',
        'status': 'Mark as Read',
        'isDone': false,
      },
      {
        'icon': Icons.favorite,
        'title': 'Prayer',
        'subtitle': '5 minutes',
        'status': 'Done',
        'isDone': true,
      },
      {
        'icon': Icons.edit_note,
        'title': 'Reflection',
        'subtitle': 'Journal entry',
        'status': 'Reflect',
        'isDone': false,
      },
    ];

    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(CustomAssets.today_s_plan_background),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(20.r),
          ),
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with title and fire badge
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: AppColors.primaryColor,
                        size: 20.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Today\'s Plan',
                        style: AppFonts.urbanistBold(
                          fontSize: 18.sp,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 1.w,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '1/3',
                          style: AppFonts.urbanistBold(
                            fontSize: 10.sp,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              // Plan items
              ...plans.map(
                (plan) => _buildPlanItem(
                  plan['icon'] as IconData,
                  plan['title'] as String,
                  plan['subtitle'] as String,
                  plan['status'] as String,
                  plan['isDone'] as bool,
                ),
              ),
              SizedBox(height: 8.h),
              // View Full Plan button
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
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                  ),
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
                      SizedBox(width: 6.w),
                      Icon(
                        Icons.arrow_forward,
                        size: 16.sp,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlanItem(
    IconData icon,
    String title,
    String subtitle,
    String status,
    bool isDone,
  ) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          // Circular checkbox
          Container(
            width: 35.w,
            height: 35.h,
            decoration: BoxDecoration(
              //color: isDone ? AppColors.primaryColor : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primaryColor.withValues(alpha: 1.3),
                width: 3.w,
              ),
            ),
            child: isDone
                ? Icon(Icons.check, color:AppColors.primaryColor, size: 26.sp)
                : null,
          ),
          SizedBox(width: 12.w),
          // Title and subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppFonts.urbanistSemiBold(
                    fontSize: 15.sp,
                    color: AppColors.whiteColor,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  subtitle,
                  style: AppFonts.urbanistRegular(
                    fontSize: 13.sp,
                    color: AppColors.white500.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
          // Status button
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: isDone ? AppColors.primaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: AppColors.primaryColor, width: 1.5.w),
            ),
            child: Text(
              status,
              style: AppFonts.urbanistSemiBold(
                fontSize: 12.sp,
                color: isDone ? Colors.black : AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Streak Calendar Widget - Full Page
  Widget _buildStreakCalendar(BuildContext context) {
    final controller = Get.put(StreakCalendarController());
    final DateTime now = DateTime.now();

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(CustomAssets.onBoardingImage, fit: BoxFit.cover),
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
                  ),
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
                      SizedBox(width: 40.w),
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
                        // Current month calendar
                        _buildMonthCalendar(
                          _monthYearString(DateTime(now.year, now.month, 1)),
                          DateTime(now.year, now.month, 1),
                          controller,
                        ),
                        SizedBox(height: 30.h),
                        // Next month calendar
                        _buildMonthCalendar(
                          _monthYearString(
                            DateTime(now.year, now.month + 1, 1),
                          ),
                          DateTime(now.year, now.month + 1, 1),
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

  String _monthYearString(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.year}';
  }

  Widget _buildMonthCalendar(
    String monthYear,
    DateTime firstDayOfMonth,
    StreakCalendarController controller,
  ) {
    final daysInMonth = DateTime(
      firstDayOfMonth.year,
      firstDayOfMonth.month + 1,
      0,
    ).day;
    final firstWeekday = (firstDayOfMonth.weekday - 1) % 7;

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
            children: ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'].map((
              day,
            ) {
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
          _buildCalendarGrid(
            firstDayOfMonth,
            daysInMonth,
            firstWeekday,
            controller,
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarGrid(
    DateTime firstDay,
    int daysInMonth,
    int firstWeekday,
    StreakCalendarController controller,
  ) {
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

      // When a full week is ready, push it and start a new one
      if (currentWeek.length == 7) {
        weeks.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.from(currentWeek),
          ),
        );
        weeks.add(SizedBox(height: 12.h));
        currentWeek.clear();
      }
    }

    // Add remaining days (last partial week)
    if (currentWeek.isNotEmpty) {
      while (currentWeek.length < 7) {
        currentWeek.add(_buildEmptyDay());
      }
      weeks.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.from(currentWeek),
        ),
      );
    }

    return Column(children: weeks);
  }

  Widget _buildEmptyDay() {
    return SizedBox(width: 38.w, height: 38.h);
  }

  Widget _buildDayCircle(int day, bool hasStreak) {
    return Container(
      width: 38.w,
      height: 38.h,
      decoration: BoxDecoration(
        color: Color(0xFF5A5A5A).withValues(alpha: 0.6),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: hasStreak
            ? Text('🔥', style: TextStyle(fontSize: 18.sp))
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
