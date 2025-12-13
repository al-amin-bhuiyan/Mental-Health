import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../core/custom_assets/custom_assets.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_fonts/app_fonts.dart';
import 'manage_subscription_controller.dart';

class ManageSubscriptionPage extends StatelessWidget {
  const ManageSubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ManageSubscriptionController controller = Get.put(
      ManageSubscriptionController(),
      tag: 'manage_subscription',
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(CustomAssets.onBoardingImage),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // App Bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColors.whiteColor,
                          size: 20.sp,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Manage Subscription',
                          style: AppFonts.urbanistBold(
                            fontSize: 20.sp,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 40.w), // For centering
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              // Subscription Plans
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: controller.plans.map((plan) {
                      return _buildPlanCard(
                        plan: plan,
                        controller: controller,
                        context: context,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required SubscriptionPlan plan,
    required ManageSubscriptionController controller,
    required BuildContext context,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
          width: 1.w,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Plan Name
          Text(
            plan.name,
            style: AppFonts.urbanistBold(
              fontSize: 18.sp,
              color: AppColors.whiteColor,
            ),
          ),

          SizedBox(height: 6.h),

          // Plan Description
          Text(
            plan.description,
            style: AppFonts.urbanistRegular(
              fontSize: 13.sp,
              color: AppColors.grayColor,
            ),
          ),

          SizedBox(height: 16.h),

          // Price
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                plan.price,
                style: AppFonts.urbanistBold(
                  fontSize: 32.sp,
                  color: AppColors.primaryColor,
                ),
              ),
              Text(
                plan.period,
                style: AppFonts.urbanistMedium(
                  fontSize: 14.sp,
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),

          SizedBox(height: 20.h),

          // Purchase Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.purchasePlan(plan.planType, context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                'Purchase Plan',
                style: AppFonts.urbanistBold(
                  fontSize: 16.sp,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
