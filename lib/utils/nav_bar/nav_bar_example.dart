import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/nav_bar/nav_bar.dart';
import '../../utils/nav_bar/nav_bar_controller.dart';

/// Example of how to use CustomNavBar in your app
///
/// Usage:
/// ```dart
/// class HomePage extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return Scaffold(
///       body: YourContent(),
///       bottomNavigationBar: CustomNavBar(),
///     );
///   }
/// }
/// ```
class NavBarExamplePage extends StatelessWidget {
  const NavBarExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    final NavBarController controller = Get.find<NavBarController>();

    return Scaffold(
      backgroundColor: AppColors.blackLightColor,
      body: Obx(() {
        // Display different content based on selected index
        return IndexedStack(
          index: controller.selectedIndex.value,
          children: [
            _buildPage('Home', Icons.home),
            _buildPage('Journal', Icons.book),
            _buildPage('AI Chatbot', Icons.chat),
            _buildPage('The Bible', Icons.menu_book),
            _buildPage('Profile', Icons.person),
          ],
        );
      }),
      bottomNavigationBar: const CustomNavBar(),
    );
  }

  Widget _buildPage(String title, IconData icon) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 10.sp,
            color: AppColors.primaryColor,
          ),
          SizedBox(height: 20.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 24.sp,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

