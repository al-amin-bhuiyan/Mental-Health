import 'package:get/get.dart';

class StreakCalendarController extends GetxController {
  // Observable variables
  var streakDays = <DateTime>[].obs;
  var currentStreak = 5.obs;

  @override
  void onInit() {
    super.onInit();
    loadStreakData();
  }

  void loadStreakData() {
    // Mock streak data - December 2025
    streakDays.value = [
      DateTime(2025, 12, 2),
      DateTime(2025, 12, 5),
      DateTime(2025, 12, 6),
      DateTime(2025, 12, 7),
      DateTime(2025, 12, 8),
      DateTime(2025, 12, 9),
      DateTime(2025, 12, 13),
      DateTime(2025, 12, 14),
      DateTime(2025, 12, 15),
      DateTime(2025, 12, 16),
      DateTime(2025, 12, 20),
      DateTime(2025, 12, 21),
      DateTime(2025, 12, 22),
      DateTime(2025, 12, 23),
      DateTime(2025, 12, 24),
      DateTime(2025, 12, 27),
      DateTime(2025, 12, 28),
      DateTime(2025, 12, 29),
      DateTime(2025, 12, 30),
      // January 2026
      DateTime(2026, 1, 16),
    ];
  }

  bool hasStreakOnDate(DateTime date) {
    return streakDays.any((streakDate) =>
        streakDate.year == date.year &&
        streakDate.month == date.month &&
        streakDate.day == date.day);
  }
}

