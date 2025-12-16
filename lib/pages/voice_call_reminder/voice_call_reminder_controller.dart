import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VoiceCallReminderController extends GetxController {
  // Selected section: 'time', 'timezone', or 'repeat'
  RxString selectedSection = 'time'.obs;

  // Selected time components
  RxInt selectedHour = 9.obs;
  RxInt selectedMinute = 0.obs;
  RxString selectedPeriod = 'AM'.obs;

  // Selected time as formatted string
  RxString selectedTime = '09:00 AM'.obs;

  // Days of the week
  final List<String> days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

  // Selected days (Daily by default - all true)
  RxList<bool> selectedDays = <bool>[true, true, true, true, true, true, true].obs;

  // Update hour
  void updateHour(int hour) {
    selectedHour.value = hour;
    _updateTimeString();
  }

  // Update minute
  void updateMinute(int minute) {
    selectedMinute.value = minute;
    _updateTimeString();
  }

  // Update period (AM/PM)
  void updatePeriod(String period) {
    selectedPeriod.value = period;
    _updateTimeString();
  }

  // Update the time string
  void _updateTimeString() {
    final hour = selectedHour.value.toString().padLeft(2, '0');
    final minute = selectedMinute.value.toString().padLeft(2, '0');
    selectedTime.value = '$hour:$minute ${selectedPeriod.value}';
  }

  // Toggle specific day
  void toggleDay(int index) {
    selectedDays[index] = !selectedDays[index];
    selectedDays.refresh();
  }

  // Get repeat text based on selected days
  String getRepeatText() {
    final selectedCount = selectedDays.where((selected) => selected).length;

    if (selectedCount == 7) {
      return 'Daily';
    } else if (selectedCount == 0) {
      return 'Never';
    } else if (selectedCount == 1) {
      final index = selectedDays.indexWhere((selected) => selected);
      return days[index];
    } else if (selectedCount == 5 &&
               selectedDays[0] && selectedDays[1] && selectedDays[2] &&
               selectedDays[3] && selectedDays[4]) {
      return 'Weekdays';
    } else if (selectedCount == 2 && selectedDays[5] && selectedDays[6]) {
      return 'Weekends';
    } else {
      return '$selectedCount days';
    }
  }

  // Select time - Shows the time picker
  Future<void> selectTime(BuildContext context) async {
    print('🕐 Call Time icon tapped!');
    selectedSection.value = 'time';
  }

  // Time zones list
  final List<Map<String, String>> timeZones = [
    {'name': 'PST (UTC-8)', 'value': 'PST'},
    {'name': 'MST (UTC-7)', 'value': 'MST'},
    {'name': 'CST (UTC-6)', 'value': 'CST'},
    {'name': 'EST (UTC-5)', 'value': 'EST'},
    {'name': 'GMT (UTC+0)', 'value': 'GMT'},
    {'name': 'CET (UTC+1)', 'value': 'CET'},
    {'name': 'IST (UTC+5:30)', 'value': 'IST'},
    {'name': 'JST (UTC+9)', 'value': 'JST'},
  ];

  // Selected timezone
  RxString selectedTimeZone = 'PST (UTC-8)'.obs;

  // Select timezone - Shows the timezone picker
  void selectTimeZone(BuildContext context) {
    print('🌍 Time Zone icon tapped!');
    selectedSection.value = 'timezone';
  }

  // Select repeat - Shows the repeat picker
  void selectRepeat(BuildContext context) {
    print('🔁 Repeat icon tapped!');
    selectedSection.value = 'repeat';
  }

  // Save reminder settings
  void saveReminder() {
    // Check if at least one day is selected
    if (!selectedDays.contains(true)) {
      Get.snackbar(
        'No Days Selected',
        'Please select at least one day',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // TODO: Call API to save reminder settings
    Get.snackbar(
      'Success',
      'Voice call reminder has been set for ${selectedTime.value}',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: Duration(seconds: 2),
    );
  }
}
