import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../core/custom_assets/custom_assets.dart';
import '../../global/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller with GoRouter
    final controller = Get.put(SplashController());

    // Initialize navigation after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.initialize(GoRouter.of(context));
    });

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            CustomAssets.backgroundImage,
            fit: BoxFit.cover,
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App Logo SVG
                SvgPicture.asset(
                  CustomAssets.splashLogo,
                  width: 150.w,
                  height: 150.h,
                ),
                SizedBox(height: 24),
                // App Name

                SizedBox(height: 16),
                // Tagline
                // Text(
                //   'Your wellness companion',
                //   'Your wellness companion',
                //   style: AppFonts.urbanistSemiBold(fontSize: 32.sp, color: AppColors.white500),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

