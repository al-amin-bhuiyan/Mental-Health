class AppPath {
  // Private constructor to prevent instantiation
  AppPath._();

  // Main routes
  static const String splash = '/';
  static const String onBoarding = '/onboarding';
  static const String home = '/home';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgetPassword = '/forget-password';
  static const String otpVerification = '/otp-verification';
  static const String newPassword = '/new-password';
  static const String tellUsYourself = '/tell-us-yourself';
  static const String profile = '/profile';
  static const String settings = '/settings';

  // Mental Health specific routes
  static const String chat = '/chat';
  static const String mood = '/mood';
  static const String journal = '/journal';
  static const String resources = '/resources';
  static const String therapy = '/therapy';
  static const String meditation = '/meditation';
  static const String exercises = '/exercises';

  // Detail routes
  static const String chatDetail = '/chat/:id';
  static const String journalDetail = '/journal/:id';
  static const String resourceDetail = '/resources/:id';

  // Helper methods to generate dynamic paths
  static String getChatDetail(String id) => '/chat/$id';
  static String getJournalDetail(String id) => '/journal/$id';
  static String getResourceDetail(String id) => '/resources/$id';
}

