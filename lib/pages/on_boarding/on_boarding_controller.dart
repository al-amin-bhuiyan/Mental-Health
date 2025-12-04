import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../core/app_route/route_path.dart';

class OnBoardingController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;

  void onPageChanged(int page) {
    currentPage.value = page;
  }

  void nextPage() {
    if (currentPage.value < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void createAccount(BuildContext context) {
    // Navigate to registration/sign up page
    context.pushNamed(RoutePath.signup);
  }

  void login(BuildContext context) {
    // Navigate to login page
    context.pushNamed(RoutePath.login);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

