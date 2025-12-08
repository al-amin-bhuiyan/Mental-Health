import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../../pages/login/login.dart';
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
        builder: (context, state) => const Scaffold(
          body: Center(
            child: Text('Profile Screen'),
          ),
        ),
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

