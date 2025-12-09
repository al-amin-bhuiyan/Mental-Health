import 'package:get/get.dart';

class ViewFullPlanController extends GetxController {
  // Observable variables
  var plans = <Map<String, dynamic>>[].obs;
  var selectedDate = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();
    loadPlans();
  }

  void loadPlans() {
    // Mock data for today's plans
    plans.value = [
      {
        'icon': 'menu_book',
        'title': 'Morning Devotional',
        'time': '6:00 AM - 6:30 AM',
        'duration': '30 minutes',
        'status': 'Done',
        'description': 'Start your day with Bible reading and reflection',
      },
      {
        'icon': 'church',
        'title': 'Prayer Time',
        'time': '6:30 AM - 6:35 AM',
        'duration': '5 minutes',
        'status': 'Done',
        'description': 'Connect with God through prayer',
      },
      {
        'icon': 'fitness_center',
        'title': 'Exercise',
        'time': '7:00 AM - 7:30 AM',
        'duration': '30 minutes',
        'status': 'In Progress',
        'description': 'Physical activity for a healthy body',
      },
      {
        'icon': 'book',
        'title': 'Bible Study',
        'time': '12:00 PM - 1:00 PM',
        'duration': '1 hour',
        'status': 'Upcoming',
        'description': 'Deep dive into scripture',
      },
      {
        'icon': 'edit_note',
        'title': 'Journal Reflection',
        'time': '9:00 PM - 9:30 PM',
        'duration': '30 minutes',
        'status': 'Upcoming',
        'description': 'Reflect on your day and document your journey',
      },
      {
        'icon': 'bedtime',
        'title': 'Evening Prayer',
        'time': '10:00 PM - 10:15 PM',
        'duration': '15 minutes',
        'status': 'Upcoming',
        'description': 'End your day with gratitude and prayer',
      },
    ];
  }

  void markAsDone(int index) {
    plans[index]['status'] = 'Done';
    plans.refresh();
  }

  void markAsInProgress(int index) {
    plans[index]['status'] = 'In Progress';
    plans.refresh();
  }

  int get completedCount => plans.where((plan) => plan['status'] == 'Done').length;
  int get totalCount => plans.length;
  double get progressPercentage => completedCount / totalCount;
}

