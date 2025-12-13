import 'package:get/get.dart';

class NotificationController extends GetxController {
  // Observable for notifications
  var notifications = <NotificationItem>[].obs;

  // Track read/unread status
  var hasUnreadNotifications = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadNotifications();
  }

  // Load notifications
  void loadNotifications() {
    // Sample data - replace with API call
    notifications.value = [
      NotificationItem(
        id: '1',
        title: '"Great job! Your 3-day streak is alive 🔥 Keep the light burning.',
        time: '11:00 AM',
        isToday: true,
        isRead: false,
      ),
      NotificationItem(
        id: '2',
        title: 'Feeling better? Here\'s a verse to strengthen your heart ❤️',
        time: '11:00 AM',
        isToday: true,
        isRead: false,
      ),
      NotificationItem(
        id: '3',
        title: 'A beautiful verse you saved — want to share it with someone today?',
        time: '11:00 AM',
        isToday: true,
        isRead: false,
      ),
      NotificationItem(
        id: '4',
        title: '"Great job! Your 3-day streak is alive 🔥 Keep the light burning.',
        time: '11:00 AM',
        isToday: false,
        isRead: false,
      ),
      NotificationItem(
        id: '5',
        title: 'Feeling better? Here\'s a verse to strengthen your heart ❤️',
        time: '11:00 AM',
        isToday: false,
        isRead: false,
      ),
      NotificationItem(
        id: '6',
        title: 'A beautiful verse you saved — want to share it with someone today?',
        time: '11:00 AM',
        isToday: false,
        isRead: false,
      ),
    ];
  }

  // Mark all as read
  void markAllAsRead() {
    for (var notification in notifications) {
      notification.isRead = true;
    }
    hasUnreadNotifications.value = false;
    notifications.refresh();
  }

  // Mark single notification as read
  void markAsRead(String id) {
    final notification = notifications.firstWhere((n) => n.id == id);
    notification.isRead = true;
    notifications.refresh();

    // Check if all notifications are read
    hasUnreadNotifications.value = notifications.any((n) => !n.isRead);
  }

  // Get today notifications
  List<NotificationItem> get todayNotifications {
    return notifications.where((n) => n.isToday).toList();
  }

  // Get yesterday notifications
  List<NotificationItem> get yesterdayNotifications {
    return notifications.where((n) => !n.isToday).toList();
  }
}

// Notification model
class NotificationItem {
  String id;
  String title;
  String time;
  bool isToday;
  bool isRead;

  NotificationItem({
    required this.id,
    required this.title,
    required this.time,
    required this.isToday,
    required this.isRead,
  });
}

