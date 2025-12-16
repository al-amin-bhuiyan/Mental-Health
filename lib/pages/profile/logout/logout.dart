import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../core/custom_assets/custom_assets.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_fonts/app_fonts.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showLogoutDialog(context), // Show logout dialog
          child: Text('Show Logout Dialog'),
        ),
      ),
    );
  }

  // Method to show the logout dialog
  void _showLogoutDialog(BuildContext context) {
    Get.defaultDialog(
      title: 'Do you want to Logout Your profile?',
      backgroundColor: Colors.black.withOpacity(0.8),
      barrierDismissible: false,
      radius: 10.0,
      content: Column(
        children: [
          // Add some space
          SizedBox(height: 20.h),
          // Row of the buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // No Button
              ElevatedButton(
                onPressed: () => context.pop(), // Close dialog if 'No' is clicked
                style: ElevatedButton.styleFrom(
              //    primary: AppColors.grayColor, // Grey button for No
                  padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('No', style: TextStyle(fontSize: 16.sp)),
              ),
              SizedBox(width: 20.w), // Space between buttons
              // Yes Button
              ElevatedButton(
                onPressed: () {
                  // Logout logic
                  context.pop(); // Close the dialog
                  _logout(); // Call logout method
                },
                style: ElevatedButton.styleFrom(
                //  primary: Colors.orange, // Orange button for Yes
                  padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Yes', style: TextStyle(fontSize: 16.sp)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Logout logic (You can implement actual logout logic here)
  void _logout() {
    // Simulate logout
    Get.snackbar('Logged out', 'You have been logged out', snackPosition: SnackPosition.BOTTOM);
  }
}
