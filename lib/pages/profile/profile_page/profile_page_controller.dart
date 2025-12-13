import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../../../core/app_route/app_path.dart';

class ProfilePageController extends GetxController {
  // User profile data
  var userName = 'Alastair Black'.obs;
  var userProfileImage = ''.obs; // Add profile image URL if available

  // Navigation methods
  void navigateToChangePassword(BuildContext context) {
    // Navigate to change password page
    context.push(AppPath.changePassword);
  }

  void navigateToNotifications(BuildContext context) {
    // Navigate to notifications page
              context.push(AppPath.notification);
  }

  void navigateToBibleVersion(BuildContext context) {
    // Navigate to bible version page
    context.push(AppPath.bibleVersion);
  }

  void navigateToManageSubscription(BuildContext context) {
    // Navigate to manage subscription page
    // context.push(AppPath.manageSubscription);
    Get.snackbar(
      'Manage Subscription',
      'Manage subscription feature will be implemented',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFFE27000),
      colorText: Colors.white,
    );
  }

  void navigateToLanguage(BuildContext context) {
    // Navigate to language page
    // context.push(AppPath.language);
    Get.snackbar(
      'Language',
      'Language feature will be implemented',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFFE27000),
      colorText: Colors.white,
    );
  }

  void navigateToAboutUs(BuildContext context) {
    // Navigate to about us page
    // context.push(AppPath.aboutUs);
    Get.snackbar(
      'About Us',
      'About us feature will be implemented',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFFE27000),
      colorText: Colors.white,
    );
  }

  void navigateToPrivacyPolicy(BuildContext context) {
    // Navigate to privacy policy page
    // context.push(AppPath.privacyPolicy);
    Get.snackbar(
      'Privacy Policy',
      'Privacy policy feature will be implemented',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFFE27000),
      colorText: Colors.white,
    );
  }

  void navigateToTermsAndConditions(BuildContext context) {
    // Navigate to terms and conditions page
    // context.push(AppPath.termsAndConditions);
    Get.snackbar(
      'Terms & Conditions',
      'Terms & Conditions feature will be implemented',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFFE27000),
      colorText: Colors.white,
    );
  }

  void navigateToUpgradePlan(BuildContext context) {
    // Navigate to upgrade plan page
    // context.push(AppPath.upgradePlan);
    Get.snackbar(
      'Upgrade Plan',
      'Upgrade plan feature will be implemented',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFFE27000),
      colorText: Colors.white,
    );
  }

  void logout(BuildContext context) {
    // Show confirmation dialog
    Get.defaultDialog(
      title: 'Logout',
      middleText: 'Are you sure you want to logout?',
      textConfirm: 'Yes',
      textCancel: 'No',
      confirmTextColor: Colors.white,
      buttonColor: const Color(0xFFE27000),
      cancelTextColor: const Color(0xFFE27000),
      onConfirm: () {
        Get.back(); // Close dialog
        // Perform logout
        context.go(AppPath.login);
      },
    );
  }
}

