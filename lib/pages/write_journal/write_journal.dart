import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../core/custom_assets/custom_assets.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_fonts/app_fonts.dart';
import 'write_journal_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WriteJournalPage extends StatelessWidget {
  final String? verse;
  final String? reference;
  final String? mood;

  const WriteJournalPage({
    super.key,
    this.verse,
    this.reference,
    this.mood,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WriteJournalController());

    // Set initial data if provided
    if (verse != null || reference != null || mood != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.setInitialData(
          verse: verse,
          reference: reference,
          mood: mood,
        );
      });
    }

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            CustomAssets.onBoardingImage,
            fit: BoxFit.cover,
          ),

          // Main Content
          SafeArea(
            child: Column(
              children: [
                // Header
                _buildHeader(context),

                // Scrollable Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16.h),
                        // Today's Reflection Header
                        _buildReflectionHeader(),
                        SizedBox(height: 16.h),
                        // Mood Selection Box
                        _buildMoodSelectionBox(controller),
                        SizedBox(height: 16.h),
                        // Timestamp
                        _buildTimestamp(),
                        SizedBox(height: 16.h),
                        // Journal Title Section
                        _buildJournalTitleSection(controller),
                        SizedBox(height: 16.h),
                        // Write Your Entry Section
                        _buildWriteEntrySection(controller),
                        SizedBox(height: 20.h),
                        // Show selected image if available
                        Obx(() {
                          if (controller.selectedImage.value != null) {
                            return Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12.r),
                                  child: Image.file(
                                    controller.selectedImage.value!,
                                    width: double.infinity,
                                    height: 180.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 8.h,
                                  right: 8.w,
                                  child: GestureDetector(
                                    onTap: () => controller.removeImage(),
                                    child: Container(
                                      width: 28.w,
                                      height: 28.h,
                                      decoration: BoxDecoration(
                                        color: Colors.red.withValues(alpha: 0.85),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.close,
                                        color: AppColors.whiteColor,
                                        size: 18.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                          return SizedBox.shrink();
                        }),
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

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.whiteColor,
                  size: 18.sp,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Write Journal',
                style: AppFonts.urbanistBold(
                  fontSize: 18.sp,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
          SizedBox(width: 40.w),
        ],
      ),
    );
  }

  Widget _buildReflectionHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '✨',
              style: TextStyle(fontSize: 20.sp),
            ),
            SizedBox(width: 8.w),
            Text(
              'Today\'s Reflection',
              style: AppFonts.urbanistBold(
                fontSize: 18.sp,
                color: AppColors.whiteColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 6.h),
        Text(
          'Take a few minutes for your heart today',
          style: AppFonts.urbanistRegular(
            fontSize: 13.sp,
            color: AppColors.white500.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildMoodSelectionBox(WriteJournalController controller) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Color(0xFFC8C8C8),
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
                'How are you feelings?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w600,
                  height: 1.40,
                  letterSpacing: 0.20,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          // Mood Icons Row
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildMoodItem(controller, CustomAssets.happy_icon, 'Happy'),
                  _buildMoodItem(controller, CustomAssets.anxious_icon, 'Anxious'),
                  _buildMoodItem(controller, CustomAssets.calm_icon, 'Calm'),
                  _buildMoodItem(controller, CustomAssets.angry_icon, 'Angry'),
                  _buildMoodItem(controller, CustomAssets.awful_icon, 'Awful'),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildMoodItem(WriteJournalController controller, String icon, String label) {
    final isSelected = controller.selectedMood.value == label;
    return GestureDetector(
      onTap: () => controller.selectMood(label),
      child: Container(
        padding: EdgeInsets.fromLTRB(8.w, 12.w, 8.w, 12.w),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.20),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? Color(0xFFE27000) : Colors.transparent,
            width: 1.w,
          ),
        ),
        child: Container(
          width: 40.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                width: 20.w,
                height: 16.h,
              ),
              SizedBox(height: 4.h),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.sp,
                  fontFamily: 'Urbanist',
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  letterSpacing: 0.20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimestamp() {
    final now = DateTime.now();
    final timeString = '${_getDay(now)}, ${_formatTime(now)}';

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.20),
        borderRadius: BorderRadius.circular(9999.r),
        border: Border.all(
          width: 0.20,
          color: Color(0xFFB5B5B5),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            timeString,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w500,
              letterSpacing: 0.20,
            ),
          ),
        ],
      ),
    );
  }

  String _getDay(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final compareDate = DateTime(date.year, date.month, date.day);

    if (compareDate == today) {
      return 'Today';
    } else if (compareDate == today.subtract(Duration(days: 1))) {
      return 'Yesterday';
    } else {
      final days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
      return days[date.weekday - 1];
    }
  }

  String _formatTime(DateTime date) {
    final hour = date.hour > 12 ? date.hour - 12 : date.hour;
    final minute = date.minute.toString().padLeft(2, '0');
    final period = date.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }

  Widget _buildJournalTitleSection(WriteJournalController controller) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          width: 1.w,
          color: Color(0xFF727272),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                CustomAssets.journal_title_icon,
                width: 12.w,
                height: 12.h,
              ),
              SizedBox(width: 6.w),
              Text(
                'Journal Title',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.30,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                width: 0.50,
                color: Color(0xFF828282),
              ),
            ),
            child: TextField(
              controller: controller.titleController,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w400,
                height: 1.40,
                letterSpacing: 0.20,
              ),
              decoration: InputDecoration(
                hintText: 'What made you smile today?',
                hintStyle: TextStyle(
                  color: Color(0xFFAEAEAE),
                  fontSize: 12.sp,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w400,
                  height: 1.40,
                  letterSpacing: 0.20,
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.all(12.w),
                  child: SvgPicture.asset(
                    CustomAssets.what_made_you_smile_today_icon,
                    width: 18.w,
                    height: 18.h,
                  ),
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWriteEntrySection(WriteJournalController controller) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          width: 1.w,
          color: Color(0xFF727272),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                CustomAssets.write_icon,
                width: 12.w,
                height: 12.h,
              ),
              SizedBox(width: 6.w),
              Text(
                'Write Your Entry',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.30,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                width: 0.50,
                color: Color(0xFF828282),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: controller.reflectionController,
                  maxLines: 4,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w400,
                    height: 1.40,
                    letterSpacing: 0.20,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Today I\'m grateful for the warm sunlight streaming through my window and the quiet moments of peace...',
                    hintStyle: TextStyle(
                      color: Color(0xFFAEAEAE),
                      fontSize: 12.sp,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w400,
                      height: 1.40,
                      letterSpacing: 0.20,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  width: double.infinity,
                  height: 0.5,
                  color: Color(0xFF4F4F4F),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => controller.pickImage(),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            CustomAssets.add_image_icon,
                            width: 16.w,
                            height: 16.h,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'Add image',
                            style: TextStyle(
                              color: Color(0xFFAEAEAE),
                              fontSize: 12.sp,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w500,
                              height: 1.40,
                              letterSpacing: 0.20,
                            ),
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
}

