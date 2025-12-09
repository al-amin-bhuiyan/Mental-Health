import 'package:get/get.dart';

class StreakCalendarController extends GetxController {
  // Observable variables
  var selectedMonth = DateTime.now().obs;
  var streakDays = <DateTime>[].obs;
  var currentStreak = 5.obs;

  @override
  void onInit() {
    super.onInit();
    loadStreakData();
  }

  void loadStreakData() {
    // Mock streak data - replace with actual data from API
    final now = DateTime.now();
    streakDays.value = [
      DateTime(2025, 12, 2),
      DateTime(2025, 12, 5),
      DateTime(2025, 12, 6),
      DateTime(2025, 12, 7),
      DateTime(2025, 12, 8),
      DateTime(2025, 12, 9),
      DateTime(2026, 1, 15),
    ];
  }

  void changeMonth(int monthOffset) {
    selectedMonth.value = DateTime(
      selectedMonth.value.year,
      selectedMonth.value.month + monthOffset,
    );
  }

  bool hasStreakOnDate(DateTime date) {
    return streakDays.any((streakDate) =>
        streakDate.year == date.year &&
        streakDate.month == date.month &&
        streakDate.day == date.day);
  }

  String getMonthYearString() {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${months[selectedMonth.value.month - 1]} ${selectedMonth.value.year}';
  }
}

