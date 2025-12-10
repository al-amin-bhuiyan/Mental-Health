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

      DateTime(2025, 12, 16),
      DateTime(2025, 12, 17),
      DateTime(2025, 12, 18),
      DateTime(2025, 12, 19),
      DateTime(2025, 12, 20),
      DateTime(2025, 12, 21),
      DateTime(2025, 12, 22),
      DateTime(2025, 12, 23),


    ];
  }

  bool hasStreakOnDate(DateTime date) {
    return streakDays.any((streakDate) =>
        streakDate.year == date.year &&
        streakDate.month == date.month &&
        streakDate.day == date.day);
  }
}

