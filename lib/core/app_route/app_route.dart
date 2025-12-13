import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../../pages/add_journal/add_journal.dart';
import '../../pages/profile/manage_subscription/payment/payment.dart';
import '../../pages/view_journal/view_journal.dart';
import '../../pages/login/login.dart';
import '../../pages/voice_call_reminder/voice_call_reminder.dart';
import '../../pages/profile/profile_page/profile_page.dart';
import '../../pages/profile/edit_profile/edit_profile.dart';
import '../../pages/profile/chage_password/change_password.dart';
import '../../pages/profile/notification/notification.dart';
import '../../pages/profile/bible_version/bible_version.dart';
import '../../pages/profile/manage_subscription/manage_subscription.dart';
import 'app_path.dart';
import '../../view/screen/splash_screen.dart';
import '../../pages/on_boarding/on_boarding.dart';
import '../../pages/forget_password/forget_password.dart';
import '../../pages/verification_code/verification_code.dart';
import '../../pages/new_password/new_password.dart';
import '../../pages/sign_up/sign_up.dart';
import '../../pages/tell_us_yourself/tell_us_yourself.dart';
import '../../pages/home_page/home_page.dart';

class AppRoute {
  static final GoRouter router = GoRouter(
    initialLocation: AppPath.splash,
    routes: [
      GoRoute(
        path: AppPath.splash,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppPath.onBoarding,
        name: 'onBoarding',
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: AppPath.home,
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppPath.login,
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppPath.signup,
        name: 'signup',
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: AppPath.forgetPassword,
        name: 'forgetPassword',
        builder: (context, state) => const ForgetPasswordScreen(),
      ),
      GoRoute(
        path: AppPath.profile,
        name: 'profile',
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: AppPath.editProfile,
        name: 'editProfile',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return EditProfilePage(
            userName: extra?['userName'] as String? ?? 'User',
          );
        },
      ),
      GoRoute(
        path: AppPath.changePassword,
        name: 'changePassword',
        builder: (context, state) => const ChangePasswordPage(),
      ),
      GoRoute(
        path: AppPath.notification,
        name: 'notification',
        builder: (context, state) => const NotificationPage(),
      ),
      GoRoute(
        path: AppPath.bibleVersion,
        name: 'bibleVersion',
        builder: (context, state) => const BibleVersionPage(),
      ),
      GoRoute(
        path: AppPath.manageSubscription,
        name: 'manageSubscription',
        builder: (context, state) => const ManageSubscriptionPage(),
      ),
      GoRoute(
        path: AppPath.chat,
        name: 'chat',
        builder: (context, state) => const Scaffold(
          body: Center(
            child: Text('Chat Screen'),
          ),
        ),
      ),
      GoRoute(
        path: AppPath.otpVerification,
        name: 'otpVerification',
        builder: (context, state) {
          final showTitle = state.uri.queryParameters['showTitle'] == 'true';
          return VerificationCodeScreen(showTitle: showTitle);
        },
      ),
      GoRoute(
        path: AppPath.newPassword,
        name: 'newPassword',
        builder: (context, state) => const NewPasswordScreen(),
      ),
      GoRoute(
        path: AppPath.tellUsYourself,
        name: 'tellUsYourself',
        builder: (context, state) => const TellUsYourselfScreen(),
      ),

      GoRoute(
        path: AppPath.journal,
        name: 'viewJournal',
        builder: (context, state) => const ViewJournalPage(),
      ),

      GoRoute(
        path: AppPath.addJournal,
        name: 'addJournal',
        builder: (context, state) {
          // Extract extra data from GoRouter state
          final extra = state.extra as Map<String, dynamic>?;

          return AddJournalPage(
            verse: extra?['verse'] as String?,
            reference: extra?['reference'] as String?,
            mood: extra?['mood'] as String?,
          );
        },
      ),

      GoRoute(
        path: AppPath.voiceCallReminder,
        name: 'voiceCallReminder',
        builder: (context, state) => const VoiceCallReminderPage(),
      ),
      GoRoute(
        path: AppPath.payment,
        name: 'manageSubscription',
        builder: (context, state) => const PaymentPage(),
      ),
      // Add more routes here as needed
      // Add more routes here as needed
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Error: ${state.error}'),
      ),
    ),
  );
}

