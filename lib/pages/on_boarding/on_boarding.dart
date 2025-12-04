import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_fonts/app_fonts.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../core/custom_assets/custom_assets.dart';
import 'on_boarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        children: [
          _buildFirstPage(),
          _buildSecondPage(),
          _buildThirdPage(context, controller),
        ],
      ),
    );
  }

  // First onboarding page
  Widget _buildFirstPage() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(CustomAssets.onBoardingImage),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome message group
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome,',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 28,
                      color: AppColors.white500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Dear Child of God',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 24,
                      color: AppColors.white500,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'First, let\'s pause for a moment of prayer.',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 22,
                      color: AppColors.white500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 374),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Get.find<OnBoardingController>().nextPage();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(color: AppColors.primaryColor, width: 2),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Pray',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 18,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  // Second onboarding page
  Widget _buildSecondPage() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(CustomAssets.onBoardingImage),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Prayer message group
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dear Heavenly Father',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 28,
                      color: AppColors.white500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Please shine the light of your love upon us.',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 24,
                      color: AppColors.white500,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Keep our families safe.\nAnd bless our journey of faith we are\nabout to embark upon.',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 22,
                      color: AppColors.white500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 296),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Get.find<OnBoardingController>().nextPage();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(color: AppColors.primaryColor, width: 2),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Ameen',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 18,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  // Third onboarding page
  Widget _buildThirdPage(BuildContext context, OnBoardingController controller) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(CustomAssets.onBoardingImage),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title message group
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'A Guided Journey of Faith',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 28,
                      color: AppColors.white500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Your Spiritual for Every Step of Your Journey',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 22,
                      color: AppColors.white500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () => controller.createAccount(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Create an Account',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 18,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton(
                  onPressed: () => controller.login(context),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.primaryColor, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Login in Your Account',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 18,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: AppFonts.urbanistRegular(
                    fontSize: 12,
                    color: AppColors.white500.withValues(alpha: 0.7),
                  ),
                  children: [
                    const TextSpan(text: 'By continuing, you agree to our '),
                    TextSpan(
                      text: 'Terms of Services',
                      style: AppFonts.urbanistSemiBold(
                        fontSize: 12,
                        color: AppColors.white500,
                      ),
                    ),
                    const TextSpan(text: '\nand '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: AppFonts.urbanistSemiBold(
                        fontSize: 12,
                        color: AppColors.white500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

