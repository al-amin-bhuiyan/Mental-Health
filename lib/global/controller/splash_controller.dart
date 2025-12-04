import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../core/app_route/route_path.dart';

class SplashController extends GetxController {
  late final GoRouter _router;

  void initialize(GoRouter router) {
    _router = router;
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    // Wait for 3 seconds
    await Future.delayed(const Duration(seconds: 3));

    // Navigate to onboarding screen using named route
    _router.pushNamed(RoutePath.onBoarding);
  }
}

