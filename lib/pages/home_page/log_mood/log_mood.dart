import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../core/custom_assets/custom_assets.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_fonts/app_fonts.dart';
import 'log_mood_controller.dart';

class LogMoodPage extends StatelessWidget {
  const LogMoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LogMoodController());

    //;final x = i * spacing;
  //  final y = graphHeight - ((level - 1) * (graphHeight / 3)) + 10;
   // debugPrint(x);

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
                        onTap: () => GoRouter.of(context).pop(),
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
                            'Mood Center',
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
                      children: [
                        SizedBox(height: 20.h),
                        // Mood Selection Section
                        _buildMoodSelection(controller),
                        SizedBox(height: 24.h),
                        // Emotional Insights Graph
                        _buildEmotionalInsights(controller),
                        SizedBox(height: 24.h),
                        // Mood Calendar
                        _buildMoodCalendar(controller),
                        SizedBox(height: 24.h),
                        // Verse Recommendations
                        _buildVerseRecommendations(controller),
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

  Widget _buildMoodSelection(LogMoodController controller) {
    final moods = [
      {'icon': CustomAssets.happy_icon, 'label': 'Happy', 'color': Color(0xFF4CAF50)},
      {'icon': CustomAssets.anxious_icon, 'label': 'Anxious', 'color': Color(0xFF9C27B0)},
      {'icon': CustomAssets.calm_icon, 'label': 'Calm', 'color': Color(0xFF2196F3)},
      {'icon': CustomAssets.angry_icon, 'label': 'Angry', 'color': Color(0xFFE91E63)},
      {'icon': CustomAssets.awful_icon, 'label': 'Awful', 'color': Color(0xFFFF9800)},
    ];

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Color(0xFF2D3E3F).withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('😊', style: TextStyle(fontSize: 20.sp)),
              SizedBox(width: 8.w),
              Text(
                'How are you feeling?',
                style: AppFonts.urbanistBold(
                  fontSize: 16.sp,
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            'Select current mood to receive a comforting verse',
            style: AppFonts.urbanistRegular(
              fontSize: 13.sp,
              color: AppColors.white500.withValues(alpha: 0.7),
            ),
          ),
          SizedBox(height: 20.h),
          // Mood Grid - Two center-aligned rows (3 + 2)
          Obx(() => Column(
                children: [
                  // First row: 3 moods (center-aligned)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      final mood = moods[index];
                      final isSelected = controller.selectedMood.value == mood['label'];
                      return Padding(
                        padding: EdgeInsets.only(right: index < 2 ? 12.w : 0),
                        child: GestureDetector(
                          onTap: () => controller.selectMood(mood['label'] as String),
                          child: Container(
                            width: 85.w,
                            height: 85.h,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? (mood['color'] as Color).withValues(alpha: 0.3)
                                  : Colors.white.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(
                                color: isSelected
                                    ? (mood['color'] as Color)
                                    : Colors.transparent,
                                width: 2.w,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  mood['icon'] as String,
                                  width: 36.w,
                                  height: 36.h,
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  mood['label'] as String,
                                  style: AppFonts.urbanistSemiBold(
                                    fontSize: 12.sp,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 12.h),
                  // Second row: 2 moods (center-aligned)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(2, (index) {
                      final mood = moods[index + 3];
                      final isSelected = controller.selectedMood.value == mood['label'];
                      return Padding(
                        padding: EdgeInsets.only(right: index < 1 ? 12.w : 0),
                        child: GestureDetector(
                          onTap: () => controller.selectMood(mood['label'] as String),
                          child: Container(
                            width: 85.w,
                            height: 85.h,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? (mood['color'] as Color).withValues(alpha: 0.3)
                                  : Colors.white.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(
                                color: isSelected
                                    ? (mood['color'] as Color)
                                    : Colors.transparent,
                                width: 2.w,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  mood['icon'] as String,
                                  width: 36.w,
                                  height: 36.h,
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  mood['label'] as String,
                                  style: AppFonts.urbanistSemiBold(
                                    fontSize: 12.sp,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              )),
          SizedBox(height: 20.h),
          // Save Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.saveMood(),
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
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmotionalInsights(LogMoodController controller) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Color(0xFF2D3E3F).withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.show_chart, color: AppColors.primaryColor, size: 17.sp),
              SizedBox(width: 8.w),
              Text(
                'Your Emotional Insights',
                style: AppFonts.urbanistBold(
                  fontSize: 16.sp,
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            'See how your moods have evolved over time',
            style: AppFonts.urbanistRegular(
              fontSize: 13.sp,
              color: AppColors.white500.withValues(alpha: 0.7),
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Last 7 Days',
                  style: AppFonts.urbanistSemiBold(
                    fontSize: 14.sp,
                    color: AppColors.white500,
                  ),
                ),
                SizedBox(height: 16.h),
                // Line Chart Graph
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Vertical axis labels
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: SizedBox(
                        height: 90.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'High',
                              style: AppFonts.urbanistRegular(
                                fontSize: 10.sp,
                                color: AppColors.white500,
                              ),
                            ),
                            Text(
                              'Mid',
                              style: AppFonts.urbanistRegular(
                                fontSize: 10.sp,
                                color: AppColors.white500,
                              ),
                            ),
                            Text(
                              'Low',
                              style: AppFonts.urbanistRegular(
                                fontSize: 10.sp,
                                color: AppColors.white500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    // Line chart with mood icons
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 110.h,
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    // Line chart background
                                    Positioned.fill(
                                      child: CustomPaint(
                                        painter: MoodLineChartPainter(
                                          data: controller.weeklyMoodData,
                                          getMoodIcon: _getMoodIcon,
                                        ),
                                      ),
                                    ),
                                    // Mood icons positioned at each point
                                    ...List.generate(controller.weeklyMoodData.length, (i) {
                                      final level = controller.weeklyMoodData[i]['level'] as int;
                                      final mood = controller.weeklyMoodData[i]['mood'] as String;
                                      final spacing = constraints.maxWidth / (controller.weeklyMoodData.length - 1);
                                      final graphHeight = 95.0;
                                      final x = i * spacing;
                                      final y = graphHeight - ((level - 1) * (graphHeight / 3)) + 10;

                                      return Positioned(
                                        left: x - 16.w,
                                        top: y - 16.w,
                                        child: Container(
                                          width: 25.w,
                                          height: 25.h,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF3A4A4B),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: AppColors.primaryColor,
                                              width: 1.w,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(3.w),
                                            child: SvgPicture.asset(
                                              _getMoodIcon(mood),
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ],
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 4.h),
                          // Day labels at bottom
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: controller.weeklyMoodData.map((data) {
                              return Text(
                                data['day'] as String,
                                style: AppFonts.urbanistMedium(
                                  fontSize: 10.sp,
                                  color: AppColors.white500,
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMoodCalendar(LogMoodController controller) {
    return Obx(() {
      final currentDate = controller.currentCalendarDate.value;
      final daysInMonth = DateTime(currentDate.year, currentDate.month + 1, 0).day;
      final firstWeekday = DateTime(currentDate.year, currentDate.month, 1).weekday % 7;

      return Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Color(0xFF2D3E3F).withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.calendar_today, color: AppColors.primaryColor, size: 20.sp),
                SizedBox(width: 8.w),
                Text(
                  'Mood Calendar',
                  style: AppFonts.urbanistBold(
                    fontSize: 16.sp,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              'Tap a day to view your mood and reflection',
              style: AppFonts.urbanistRegular(
                fontSize: 13.sp,
                color: AppColors.white500.withValues(alpha: 0.7),
              ),
            ),
            SizedBox(height: 16.h),
            // Month Year with Navigation Arrows
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  controller.getMonthYearString(),
                  style: AppFonts.urbanistBold(
                    fontSize: 16.sp,
                    color: AppColors.whiteColor,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () => controller.previousMonth(),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.whiteColor,
                        size: 20.sp,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    GestureDetector(
                      onTap: () => controller.nextMonth(),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.whiteColor,
                        size: 20.sp,
                      ),
                    ),
                  ],
                )

              ],
            ),
            SizedBox(height: 16.h),
            // Weekday Headers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['S', 'M', 'T', 'W', 'T', 'F', 'S'].map((day) {
                return SizedBox(
                  width: 36.w,
                  child: Center(
                    child: Text(
                      day,
                      style: AppFonts.urbanistSemiBold(
                        fontSize: 12.sp,
                        color: AppColors.white500,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 12.h),
            // Calendar Grid
            _buildCalendarGrid(firstWeekday, daysInMonth, controller),
          ],
        ),
      );
    });
  }

  Widget _buildCalendarGrid(int firstWeekday, int daysInMonth, LogMoodController controller) {
    List<Widget> weeks = [];
    List<Widget> currentWeek = [];

    // Add empty spaces
    for (int i = 0; i < firstWeekday; i++) {
      currentWeek.add(SizedBox(width: 36.w, height: 36.h));
    }

    // Add days
    for (int day = 1; day <= daysInMonth; day++) {
      final hasMood = controller.hasMoodOnDate(day);
      final mood = controller.getMoodForDate(day);

      currentWeek.add(
        Container(
          width: 36.w,
          height: 36.h,
          margin: EdgeInsets.all(2.w),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: hasMood && mood != null
                ? SvgPicture.asset(
                    _getMoodIcon(mood),
                    width: 20.w,
                    height: 20.h,
                  )
                : Text(
                    '$day',
                    style: AppFonts.urbanistMedium(
                      fontSize: 12.sp,
                      color: AppColors.white500,
                    ),
                  ),
          ),
        ),
      );

      if (currentWeek.length == 7) {
        weeks.add(
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.from(currentWeek),
            ),
          ),
        );
        currentWeek.clear();
      }
    }

    // Add remaining days
    if (currentWeek.isNotEmpty) {
      while (currentWeek.length < 7) {
        currentWeek.add(SizedBox(width: 36.w, height: 36.h));
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

  Widget _buildVerseRecommendations(LogMoodController controller) {
    return Builder(
      builder: (context) {
        final verses = [
          {
            'mood': 'anxious',
            'badge': 'For Anxious',
            'verse':
                '"Do not be anxious about anything, but in every situation, by prayer and petition with thanksgiving, present your requests to God."',
            'reference': '— Philippians 4:6',
          },
          {
            'mood': 'awful',
            'badge': 'For Awful',
            'verse':
                '"The Lord is close to the brokenhearted and saves those who are crushed in spirit."',
            'reference': '— Psalm 34:18',
          },
          {
            'mood': 'angry',
            'badge': 'For Angry',
            'verse':
                '"For I know the plans I have for you, declares the Lord, plans to prosper you and not to harm you, plans to give you hope and a future."',
            'reference': '— Jeremiah 29:11',
          },
        ];

        return Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Color(0xFF2D3E3F).withValues(alpha: 0.9),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.menu_book, color: AppColors.primaryColor, size: 20.sp),
                  SizedBox(width: 8.w),
                  Text(
                    'Verse Recommendations',
                    style: AppFonts.urbanistBold(
                      fontSize: 16.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                'Based on your mood, we suggest these scriptures',
                style: AppFonts.urbanistRegular(
                  fontSize: 13.sp,
                  color: AppColors.white500.withValues(alpha: 0.7),
                ),
              ),
              SizedBox(height: 16.h),
              ...verses.map((verse) => _buildVerseCard(context, controller, verse)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildVerseCard(BuildContext context, LogMoodController controller, Map<String, String> verse) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Badge
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: AppColors.primaryColor,
                width: 1.w,
              ),
            ),
            child: Text(
              verse['badge']!,
              style: AppFonts.urbanistSemiBold(
                fontSize: 11.sp,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          // Verse text
          Text(
            verse['verse']!,
            style: AppFonts.urbanistRegular(
              fontSize: 14.sp,
              color: AppColors.whiteColor,
              height: 1.5,
            ),
          ),
          SizedBox(height: 8.h),
          // Reference
          Text(
            verse['reference']!,
            style: AppFonts.urbanistSemiBold(
              fontSize: 13.sp,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(height: 12.h),
          // Add to Journal button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                // Get the current selected mood from controller
                final currentMood = controller.selectedMood.value.isNotEmpty
                    ? controller.selectedMood.value
                    : verse['mood'] ?? 'calm';

                // Navigate to Add Journal page with verse data using GoRouter
                GoRouter.of(context).pushNamed(
                  'addJournal',
                  extra: {
                    'verse': verse['verse'],
                    'reference': verse['reference'],
                    'mood': currentMood,
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              icon: Icon(Icons.book, color: Colors.white, size: 16.sp),
              label: Text(
                'Add to Journal',
                style: AppFonts.urbanistSemiBold(
                  fontSize: 14.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getMoodIcon(String mood) {
    switch (mood.toLowerCase()) {
      case 'happy':
        return CustomAssets.happy_icon;
      case 'anxious':
        return CustomAssets.anxious_icon;
      case 'calm':
        return CustomAssets.calm_icon;
      case 'angry':
        return CustomAssets.angry_icon;
      case 'awful':
        return CustomAssets.awful_icon;
      default:
        return CustomAssets.happy_icon;
    }
  }
}

// Custom Painter for Line Chart
class MoodLineChartPainter extends CustomPainter {
  final List<Map<String, dynamic>> data;
  final String Function(String) getMoodIcon;

  MoodLineChartPainter({
    required this.data,
    required this.getMoodIcon,
  });


  @override
  void paint(Canvas canvas, Size size) {
    // Main line paint (graph connection)
    final paint = Paint()
      ..color = const Color(0xFFFF6B35)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final double spacing = size.width / (data.length - 1);
    final double graphHeight = 95.0;

    // Guide line (High / Mid / Low)
    final guidePaint = Paint()
      ..color = Colors.white24
      ..strokeWidth = 1.8
      ..style = PaintingStyle.stroke;

    // Convert mood level → Y position
    double getY(int level) {
      return graphHeight - ((level - 1) * (graphHeight / 3)) +10;
    }

    // ---------------------------------------------------------
    // 🔹 Draw High, Mid, Low horizontal reference lines
    // ---------------------------------------------------------
    final lowY = getY(1);   // Level 1 (Low)
    final midY = getY(2)-10;   // Level 2 (Mid)
    final highY = getY(3)-20;  // Level 3 (High)

    canvas.drawLine(Offset(3, highY), Offset(size.width, highY), guidePaint);
    canvas.drawLine(Offset(0, midY),  Offset(size.width, midY),  guidePaint);
    canvas.drawLine(Offset(0, lowY),  Offset(size.width, lowY),  guidePaint);

    // ---------------------------------------------------------
    // 🔹 Build the line graph path
    // ---------------------------------------------------------
    final path = Path();
    final List<Offset> points = [];

    for (int i = 0; i < data.length; i++) {
      final level = data[i]['level'] as int;
      final x = i * spacing;
      final y = getY(level);
      points.add(Offset(x, y));
    }

    // Draw the connecting line
    if (points.isNotEmpty) {
      path.moveTo(points[0].dx, points[0].dy);
      for (int i = 1; i < points.length; i++) {
        path.lineTo(points[i].dx, points[i].dy);
      }
      canvas.drawPath(path, paint);
    }
  }



  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

