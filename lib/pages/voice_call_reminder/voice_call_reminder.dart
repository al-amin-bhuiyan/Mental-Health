import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../core/custom_assets/custom_assets.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_fonts/app_fonts.dart';
import 'voice_call_reminder_controller.dart';

class VoiceCallReminderPage extends StatelessWidget {
  const VoiceCallReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VoiceCallReminderController());

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(CustomAssets.onBoardingImage, fit: BoxFit.cover),

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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 16.h),

                        // Subtitle Description
                        Text(
                          'Schedule a personalized AI voice call to\ncheck in on your mental wellness journey',
                          textAlign: TextAlign.center,
                          style: AppFonts.urbanistMedium(
                            fontSize: 14.sp,
                            color: AppColors.white500,
                          ),
                        ),

                        SizedBox(height: 24.h),

                        // Settings Card
                        _buildSettingsCard(controller, context),

                        SizedBox(height: 24.h),

                        // Select Time Label
                        Text(
                          'Select Time',
                          style: AppFonts.urbanistBold(
                            fontSize: 18.sp,
                            color: AppColors.whiteColor,
                          ),
                        ),

                        SizedBox(height: 16.h),

                        // Dynamic Picker based on selected section
                        Obx(() => _buildDynamicPicker(controller)),

                        SizedBox(height: 24.h),

                        // Confirm Button
                        _buildConfirmButton(controller, context),

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
                'AI Voice Reminder',
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

  Widget _buildSettingsCard(
    VoiceCallReminderController controller,
    BuildContext context,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
          width: 1.w,
        ),
      ),
      child: Column(
        children: [
          // Call Time Row
          GestureDetector(
            onTap: () {
              print('✅ Call Time tapped!');
              controller.selectTime(context);
            },
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Row(
                children: [
                  Icon(Icons.access_time, color: AppColors.white500, size: 20.sp),
                  SizedBox(width: 12.w),
                  Text('Call Time', style: AppFonts.urbanistMedium(fontSize: 14.sp, color: AppColors.whiteColor)),
                  Spacer(),
                  Obx(() => Text(
                    controller.selectedTime.value,
                    style: AppFonts.urbanistSemiBold(fontSize: 14.sp, color: AppColors.primaryColor),
                  )),
                  SizedBox(width: 8.w),
                  Icon(Icons.chevron_right, color: AppColors.white500, size: 20.sp),
                ],
              ),
            ),
          ),

          SizedBox(height: 12.h),
          Divider(color: Colors.white.withValues(alpha: 0.1), height: 1),
          SizedBox(height: 12.h),

          // Time Zone Row
          GestureDetector(
            onTap: () {
              print('✅ Time Zone tapped!');
              controller.selectTimeZone(context);
            },
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Row(
                children: [
                  Icon(Icons.public, color: AppColors.white500, size: 20.sp),
                  SizedBox(width: 12.w),
                  Text('Time Zone', style: AppFonts.urbanistMedium(fontSize: 14.sp, color: AppColors.whiteColor)),
                  Spacer(),
                  Obx(() => Text(
                    controller.selectedTimeZone.value,
                    style: AppFonts.urbanistSemiBold(fontSize: 14.sp, color: AppColors.primaryColor),
                  )),
                  SizedBox(width: 8.w),
                  Icon(Icons.chevron_right, color: AppColors.white500, size: 20.sp),
                ],
              ),
            ),
          ),

          SizedBox(height: 12.h),
          Divider(color: Colors.white.withValues(alpha: 0.1), height: 1),
          SizedBox(height: 12.h),

          // Repeat Row
          GestureDetector(
            onTap: () {
              print('✅ Repeat tapped!');
              controller.selectRepeat(context);
            },
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Row(
                children: [
                  Icon(Icons.repeat, color: AppColors.white500, size: 20.sp),
                  SizedBox(width: 12.w),
                  Text('Repeat', style: AppFonts.urbanistMedium(fontSize: 14.sp, color: AppColors.whiteColor)),
                  Spacer(),
                  Obx(() => Text(
                    controller.getRepeatText(),
                    style: AppFonts.urbanistSemiBold(fontSize: 14.sp, color: AppColors.primaryColor),
                  )),
                  SizedBox(width: 8.w),
                  Icon(Icons.chevron_right, color: AppColors.white500, size: 20.sp),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildDynamicPicker(VoiceCallReminderController controller) {
    switch (controller.selectedSection.value) {
      case 'time':
        return _buildTimePicker(controller);
      case 'timezone':
        return _buildTimeZonePicker(controller);
      case 'repeat':
        return _buildRepeatPicker(controller);
      default:
        return _buildTimePicker(controller);
    }
  }

  Widget _buildTimePicker(VoiceCallReminderController controller) {
    return Container(
      height: 200.h,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Hour Picker
          Expanded(
            child: Obx(() => _buildScrollPicker(
                  items: List.generate(
                    12,
                    (index) => (index + 1).toString().padLeft(2, '0'),
                  ),
                  selectedIndex: controller.selectedHour.value - 1,
                  onChanged: (index) => controller.updateHour(index + 1),
                )),
          ),

          // Colon
          Text(
            ':',
            style: AppFonts.urbanistBold(
              fontSize: 24.sp,
              color: AppColors.whiteColor,
            ),
          ),

          // Minute Picker
          Expanded(
            child: Obx(() => _buildScrollPicker(
                  items: List.generate(
                    60,
                    (index) => index.toString().padLeft(2, '0'),
                  ),
                  selectedIndex: controller.selectedMinute.value,
                  onChanged: (index) => controller.updateMinute(index),
                )),
          ),

          // AM/PM Picker
          Expanded(
            child: Obx(() => _buildScrollPicker(
                  items: ['AM', 'PM'],
                  selectedIndex: controller.selectedPeriod.value == 'AM' ? 0 : 1,
                  onChanged: (index) =>
                      controller.updatePeriod(index == 0 ? 'AM' : 'PM'),
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeZonePicker(VoiceCallReminderController controller) {
    return Container(
      height: 200.h,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16.r) ,
      ),
      child: Obx(() {
        final timezoneNames = controller.timeZones.map((tz) => tz['name']!).toList();
        final selectedIndex = timezoneNames.indexOf(controller.selectedTimeZone.value);

        return _buildScrollPicker(
          items: timezoneNames,
          selectedIndex: selectedIndex >= 0 ? selectedIndex : 0,
          onChanged: (index) {
            controller.selectedTimeZone.value = timezoneNames[index];
          },
        );
      }),
    );
  }

  Widget _buildRepeatPicker(VoiceCallReminderController controller) {
    return Container(
      height: 200.h,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: _buildRepeatScrollPicker(
        items: controller.days,
        selectedDays: controller.selectedDays,
        onChanged: (index) => controller.toggleDay(index),
      ),
    );
  }

  Widget _buildRepeatScrollPicker({
    required List<String> items,
    required RxList<bool> selectedDays,
    required Function(int) onChanged,
  }) {
    return SizedBox(
      height: 200.h,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 50.h,
        diameterRatio: 1.5,
        physics: FixedExtentScrollPhysics(),
        onSelectedItemChanged: onChanged,
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: items.length,
          builder: (context, index) {
            final isSelected = selectedDays[index];
            return GestureDetector(
              onTap: () => onChanged(index),
              child: Obx(() => Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      selectedDays[index] ? Icons.check_circle : Icons.circle_outlined,
                      color: selectedDays[index] ? AppColors.primaryColor : AppColors.white500.withValues(alpha: 0.5),
                      size: 20.sp,
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      items[index],
                      style: AppFonts.urbanistBold(
                        fontSize: selectedDays[index] ? 20.sp : 16.sp,
                        color: selectedDays[index]
                            ? AppColors.whiteColor
                            : AppColors.white500.withValues(alpha: 0.5),
                      ),
                    ),
                  ],
                ),
              )),
            );
          },
        ),
      ),
    );
  }

  Widget _buildScrollPicker({
    required List<String> items,
    required int selectedIndex,
    required Function(int) onChanged,
  }) {
    return SizedBox(
      height: 200.h,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 50.h,
        diameterRatio: 1.5,
        physics: FixedExtentScrollPhysics(),
        onSelectedItemChanged: onChanged,
        controller: FixedExtentScrollController(initialItem: selectedIndex),
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: items.length,
          builder: (context, index) {
            final isSelected = index == selectedIndex;
            return Center(
              child: Text(
                items[index],
                style: AppFonts.urbanistBold(
                  fontSize: isSelected ? 24.sp : 18.sp,
                  color: isSelected
                      ? AppColors.whiteColor
                      : AppColors.white500.withValues(alpha: 0.5),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildConfirmButton(
    VoiceCallReminderController controller,
    BuildContext context,
  ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          controller.saveReminder();
          context.pop();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: Text(
          'Confirm Reminder',
          style: AppFonts.urbanistBold(
            fontSize: 16.sp,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
