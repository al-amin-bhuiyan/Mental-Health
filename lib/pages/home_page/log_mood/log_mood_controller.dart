import 'package:get/get.dart';

class LogMoodController extends GetxController {
  var selectedMood = ''.obs;
  var moodHistory = <Map<String, dynamic>>[].obs;
  var currentCalendarDate = DateTime.now().obs;

  // Sample mood data for the graph (last 7 days)
  final List<Map<String, dynamic>> weeklyMoodData = [
    {'day': 'Mon', 'mood': 'happy', 'level': 3},
    {'day': 'Tue', 'mood': 'calm', 'level': 2},
    {'day': 'Wed', 'mood': 'anxious', 'level': 4},
    {'day': 'Thu', 'mood': 'awful', 'level': 1},
    {'day': 'Fri', 'mood': 'happy', 'level': 4},
    {'day': 'Sat', 'mood': 'awful', 'level': 1},
    {'day': 'Sun', 'mood': 'anxious', 'level': 3},
  ];

  // Sample calendar data (dates with mood)
  final Map<int, String> calendarMoods = {
    1: 'happy',
    2: 'calm',
    3: 'happy',
    4: 'anxious',
    5: 'awful',
    6: 'calm',
    7: 'happy',
  };

  // Verse recommendations based on mood
  final Map<String, List<Map<String, String>>> verseRecommendations = {
    'anxious': [
      {
        'verse':
            '"Do not be anxious about anything, but in every situation, by prayer and petition with thanksgiving, present your requests to God."',
        'reference': '— Philippians 4:6',
      },
    ],
    'awful': [
      {
        'verse':
            '"The Lord is close to the brokenhearted and saves those who are crushed in spirit."',
        'reference': '— Psalm 34:18',
      },
    ],
    'angry': [
      {
        'verse':
            '"For I know the plans I have for you, declares the Lord, plans to prosper you and not to harm you, plans to give you hope and a future."',
        'reference': '— Jeremiah 29:11',
      },
    ],
    'happy': [
      {
        'verse': '"This is the day the Lord has made; let us rejoice and be glad in it."',
        'reference': '— Psalm 118:24',
      },
    ],
    'calm': [
      {
        'verse': '"Peace I leave with you; my peace I give you."',
        'reference': '— John 14:27',
      },
    ],
  };

  void selectMood(String mood) {
    selectedMood.value = mood;
  }

  void saveMood() {
    if (selectedMood.value.isNotEmpty) {
      moodHistory.add({
        'mood': selectedMood.value,
        'date': DateTime.now(),
      });
      // Navigate to insights page or show success
      Get.back();
    }
  }

  List<Map<String, String>> getVersesForMood(String mood) {
    return verseRecommendations[mood.toLowerCase()] ?? [];
  }

  bool hasMoodOnDate(int day) {
    return calendarMoods.containsKey(day);
  }

  String? getMoodForDate(int day) {
    return calendarMoods[day];
  }

  // Calendar navigation methods
  void previousMonth() {
    currentCalendarDate.value = DateTime(
      currentCalendarDate.value.year,
      currentCalendarDate.value.month - 1,
      1,
    );
  }

  void nextMonth() {
    currentCalendarDate.value = DateTime(
      currentCalendarDate.value.year,
      currentCalendarDate.value.month + 1,
      1,
    );
  }

  String getMonthYearString() {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${months[currentCalendarDate.value.month - 1]} ${currentCalendarDate.value.year}';
  }
}

