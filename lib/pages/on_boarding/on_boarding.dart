import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(CustomAssets.onBoardingImage),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(flex: 3),
              // Welcome message group
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome,',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 28.sp,
                      color: AppColors.white500,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Dear Child of God',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 24.sp,
                      color: AppColors.white500,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'First, let\'s pause for a moment of prayer.',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 18.sp,
                      color: AppColors.white500,
                    ),
                  ),
                ],
              ),
              Spacer(flex: 2),
              SizedBox(
                width: double.infinity,
                height: 48.h,
                child: ElevatedButton(
                  onPressed: () {
                    Get.find<OnBoardingController>().nextPage();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      side: BorderSide(color: AppColors.primaryColor, width: 2.w),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Pray',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 18.sp,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60.h),
            ],
          ),
        ),
      ),
    );
  }

  // Second onboarding page
  Widget _buildSecondPage() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(CustomAssets.onBoardingImage),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(flex: 3),
              // Prayer message group
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dear Heavenly Father',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 28.sp,
                      color: AppColors.white500,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Please shine the light of your love upon us.',
                    style: AppFonts.urbanistMedium(
                      fontSize: 18.sp,
                      color: AppColors.white500,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Keep our families safe.',
                    style: AppFonts.urbanistMedium(
                      fontSize: 18.sp,
                      color: AppColors.white500,
                    ),
                  ),

                  SizedBox(height: 8.h),
                  Text(
                    'And bless our journey of faith we are.',
                    style: AppFonts.urbanistMedium(
                      fontSize: 18.sp,
                      color: AppColors.white500,
                    ),
                  ),

                  SizedBox(height: 8.h),
                  Text(
                    'about to embark upon.',
                    style: AppFonts.urbanistMedium(
                      fontSize: 18.sp,
                      color: AppColors.white500,
                    ),
                  ),


                ],
              ),
              Spacer(flex: 2),
              SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: () {
                    Get.find<OnBoardingController>().nextPage();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      side: BorderSide(color: AppColors.primaryColor, width: 2.w),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Ameen',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 18.sp,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60.h),
            ],
          ),
        ),
      ),
    );
  }

  // Third onboarding page
  Widget _buildThirdPage(BuildContext context, OnBoardingController controller) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(CustomAssets.onBoardingImage),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(flex: 3),
              // Title message group
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment:  MainAxisAlignment.end,
                children: [
                  Text(
                    'A Guided Journey of Faith',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 28.sp,
                      color: AppColors.white500,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  Text(
                    'Your Spiritual for Every Step of Your Journey',
                    style: AppFonts.urbanistMedium(
                      fontSize: 16.sp,
                      color: AppColors.white500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            SizedBox(height: 24.h,),
            //  Spacer(flex: 2),
              SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: () => controller.createAccount(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Create an Account',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 18.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: double.infinity,
                height: 56.h,
                child: OutlinedButton(
                  onPressed: () => controller.login(context),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.primaryColor, width: 2.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    'Login in Your Account',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: 18.sp,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: AppFonts.urbanistRegular(
                    fontSize: 12.sp,
                    color: AppColors.white500.withValues(alpha: 0.7),
                  ),
                  children: [
                    TextSpan(text: 'By continuing, you agree to our '),
                    TextSpan(
                      text: 'Terms of Services',
                      style: AppFonts.urbanistSemiBold(
                        fontSize: 12.sp,
                        color: AppColors.white500,
                      ),
                    ),
                    TextSpan(text: '\nand '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: AppFonts.urbanistSemiBold(
                        fontSize: 12.sp,
                        color: AppColors.white500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}

