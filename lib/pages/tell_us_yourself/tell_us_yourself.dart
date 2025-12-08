import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:mental_health/core/app_route/app_path.dart';
import '../../core/custom_assets/custom_assets.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_fonts/app_fonts.dart';
import '../../utils/dimensions/dimensions.dart';
import 'tell_us_yourself_controller.dart';

// Main Screen
class TellUsYourselfScreen extends StatelessWidget {
  const TellUsYourselfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TellUsYourselfController());

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            CustomAssets.onBoardingImage,
            fit: BoxFit.cover,
          ),
          // Overlay gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.5),
                  Colors.black.withValues(alpha: 0.7),
                ],
              ),
            ),
          ),
          // Content
          SafeArea(
            child: Column(
              children: [
                // Top section with back button and progress (hidden on pages 14, 15, and 16)
                Obx(
                  () => controller.currentPage.value != 13 && controller.currentPage.value != 14 && controller.currentPage.value != 15 && controller.currentPage.value != 16
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                          child: Column(
                            children: [
                              // Back button and progress bar
                              Row(
                                children: [
                                  Container(
                                    width: 40.h,
                                    height: 40.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withValues(alpha: 0.2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        final currentPageValue = controller.currentPage.value;
                                        if (currentPageValue == 0) {
                                          // Go back to login page
                                          context.pop();
                                        } else {
                                          // Go to previous page
                                          controller.previousPage();
                                        }
                                      },
                                      icon: Icon(
                                        Icons.arrow_back_ios_new,
                                        color: AppColors.whiteColor,
                                        size: 20,
                                      ),
                                      padding: EdgeInsets.zero,
                                    ),
                                  ),
                                  Obx(
                                    () => controller.currentPage.value <= 12
                                        ? Row(
                                            children: [
                                              SizedBox(width: 47.w),
                                              SizedBox(
                                                width: 195.w,
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(Dimensions.radius),
                                                  child: LinearProgressIndicator(
                                                    value: controller.getProgress(),
                                                    backgroundColor: AppColors.white500,
                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                      AppColors.primaryColor,
                                                    ),
                                                    minHeight: Dimensions.iconSizeSmall,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : const SizedBox.shrink(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
                // Page content
                Expanded(
                  child: Obx(() {
                    switch (controller.currentPage.value) {
                      case 0:
                        return GenderPage(controller: controller);
                      case 1:
                        return AgeRangePage(controller: controller);
                      case 2:
                        return PrayerRelationshipPage(controller: controller);
                      case 3:
                        return BadHabitsPage(controller: controller);
                      case 4:
                        return BelovedChildPage(controller: controller);
                      case 5:
                        return JournalingAppsPage(controller: controller);
                      case 6:
                        return JournalingFrequencyPage(controller: controller);
                      case 7:
                        return JournalingObstaclePage(controller: controller);
                      case 8:
                        return GoalPage(controller: controller);
                      case 9:
                        return HearAboutUsPage(controller: controller);
                      case 10:
                        return Harvor5xPage(controller: controller);
                      case 11:
                        return GoalGraphPage(controller: controller);
                      case 12:
                        return YoureAllSetPage(controller: controller);
                      case 13:
                        return WelcomeToHarborPage(controller: controller);
                      case 14:
                        return NotificationPermissionPage(controller: controller);
                      case 15:
                        return StartThreeDaysFreePlanPage(controller: controller);
                      case 16:
                        return OneTimeOfferPage(controller: controller);
                      default:
                        return PlaceholderPage(
                          pageNumber: controller.currentPage.value + 1,
                        );
                    }
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== PAGE 1: GENDER SELECTION ====================
class GenderPage extends StatelessWidget {
  final TellUsYourselfController controller;

  const GenderPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: Dimensions.tellUsYourselfPageTopSpacing),
                  Text(
                    "What's Your Gender?",
                    style: AppFonts.urbanistSemiBold(
                      fontSize: Dimensions.tellUsYourselfTitleSize,
                      color: AppColors.whiteColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Dimensions.tellUsYourselfTitleToSubtitleSpacing),
                  Text(
                    'This will be used to personalize your experience',
                    style: AppFonts.urbanistRegular(
                      fontSize: Dimensions.tellUsYourselfSubtitleSize,
                      color: AppColors.white500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Dimensions.tellUsYourselfSubtitleToListSpacing),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: controller.genderOptions.map((gender) {
                      return Obx(() {
                        final isSelected = controller.selectedGender.value == gender;
                        return OptionButton(
                          text: gender,
                          isSelected: isSelected,
                          onTap: () => controller.selectGender(gender),
                        );
                      });
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: Dimensions.tellUsYourselfPageButtonSpacing),
          Obx(
            () => SizedBox(
              width: double.infinity,
              height: Dimensions.buttonHeight,
              child: ElevatedButton(
                onPressed: controller.canContinue()
                    ? controller.nextPage
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  disabledBackgroundColor:
                      AppColors.primaryColor.withValues(alpha: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimensions.heightSize),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Continue',
                  style: AppFonts.urbanistSemiBold(
                    fontSize: Dimensions.tellUsYourselfOptionSize,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: Dimensions.tellUsYourselfPageBottomSpacing),
        ],
      ),
    );
  }
}

// ==================== PAGE 2: AGE RANGE SELECTION ====================
class AgeRangePage extends StatelessWidget {
  final TellUsYourselfController controller;

  const AgeRangePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: Dimensions.tellUsYourselfPageTopSpacing),
                  Text(
                    "What's your age range?",
                    style: AppFonts.urbanistSemiBold(
                      fontSize: Dimensions.tellUsYourselfTitleSize,
                      color: AppColors.whiteColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Dimensions.tellUsYourselfTitleToSubtitleSpacing),
                  Text(
                    'This will be used to personalize your experience',
                    style: AppFonts.urbanistRegular(
                      fontSize: Dimensions.tellUsYourselfSubtitleSize,
                      color: AppColors.white500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Dimensions.tellUsYourselfSubtitleToListSpacing),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: controller.ageRangeOptions.map((ageRange) {
                      return Obx(() {
                        final isSelected = controller.selectedAgeRange.value == ageRange;
                        return OptionButton(
                          text: ageRange,
                          isSelected: isSelected,
                          onTap: () => controller.selectAgeRange(ageRange),
                        );
                      });
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: Dimensions.tellUsYourselfPageButtonSpacing),
          Obx(
            () => SizedBox(
              width: double.infinity,
              height: Dimensions.buttonHeight,
              child: ElevatedButton(
                onPressed: controller.canContinue()
                    ? controller.nextPage
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  disabledBackgroundColor:
                      AppColors.primaryColor.withValues(alpha: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimensions.heightSize),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Continue',
                  style: AppFonts.urbanistSemiBold(
                    fontSize: Dimensions.tellUsYourselfOptionSize,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: Dimensions.tellUsYourselfPageBottomSpacing),
        ],
      ),
    );
  }
}

// ==================== PAGE 3: PRAYER RELATIONSHIP ====================
class PrayerRelationshipPage extends StatelessWidget {
  final TellUsYourselfController controller;

  const PrayerRelationshipPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: Dimensions.tellUsYourselfPageTopSpacing),
                  Text(
                    'What is your relationship\nwith Prayer?',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: Dimensions.tellUsYourselfTitleSize,
                      color: AppColors.whiteColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Dimensions.tellUsYourselfTitleToSubtitleSpacing),
                  Text(
                    'This will be used to personalize your experience',
                    style: AppFonts.urbanistRegular(
                      fontSize: Dimensions.tellUsYourselfSubtitleSize,
                      color: AppColors.white500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Dimensions.tellUsYourselfSubtitleToListSpacing),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: controller.prayerRelationshipOptions.map((option) {
                      return Obx(() {
                        final isSelected = controller.selectedPrayerRelationship.value == option;
                        return OptionButton(
                          text: option,
                          isSelected: isSelected,
                          onTap: () => controller.selectPrayerRelationship(option),
                        );
                      });
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: Dimensions.tellUsYourselfPageButtonSpacing),
          Obx(
            () => SizedBox(
              width: double.infinity,
              height: Dimensions.buttonHeight,
              child: ElevatedButton(
                onPressed: controller.canContinue()
                    ? controller.nextPage
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  disabledBackgroundColor:
                      AppColors.primaryColor.withValues(alpha: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimensions.heightSize),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Continue',
                  style: AppFonts.urbanistSemiBold(
                    fontSize: Dimensions.tellUsYourselfOptionSize,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: Dimensions.tellUsYourselfPageBottomSpacing),
        ],
      ),
    );
  }
}

// ==================== PAGE 4: JOURNALING APPS ====================
class JournalingAppsPage extends StatelessWidget {
  final TellUsYourselfController controller;

  const JournalingAppsPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: Dimensions.tellUsYourselfPageTopSpacing),
                  Text(
                    'Have you tried other\njournaling apps?',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: Dimensions.tellUsYourselfTitleSize,
                      color: AppColors.whiteColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Dimensions.tellUsYourselfTitleToSubtitleSpacing),
                  Text(
                    'This will be used to personalize your experience',
                    style: AppFonts.urbanistRegular(
                      fontSize: Dimensions.tellUsYourselfSubtitleSize,
                      color: AppColors.white500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Dimensions.tellUsYourselfSubtitleToListSpacing),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: controller.journalingAppsOptions.map((option) {
                      return Obx(() {
                        final isSelected = controller.selectedJournalingApps.value == option;
                        return OptionButton(
                          text: option,
                          isSelected: isSelected,
                          onTap: () => controller.selectJournalingApps(option),
                        );
                      });
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: Dimensions.tellUsYourselfPageButtonSpacing),
          Obx(
            () => SizedBox(
              width: double.infinity,
              height: Dimensions.buttonHeight,
              child: ElevatedButton(
                onPressed: controller.canContinue()
                    ? controller.nextPage
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  disabledBackgroundColor:
                      AppColors.primaryColor.withValues(alpha: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimensions.heightSize),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Continue',
                  style: AppFonts.urbanistSemiBold(
                    fontSize: Dimensions.tellUsYourselfOptionSize,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: Dimensions.tellUsYourselfPageBottomSpacing),
        ],
      ),
    );
  }
}

// ==================== PAGE 5: JOURNALING FREQUENCY ====================
class JournalingFrequencyPage extends StatelessWidget {
  final TellUsYourselfController controller;

  const JournalingFrequencyPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: Dimensions.tellUsYourselfPageTopSpacing),
                  Text(
                    'How often do you journal?',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: Dimensions.tellUsYourselfTitleSize,
                      color: AppColors.whiteColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Dimensions.tellUsYourselfTitleToSubtitleSpacing),
                  Text(
                    'This will be used to personalize your experience',
                    style: AppFonts.urbanistRegular(
                      fontSize: Dimensions.tellUsYourselfSubtitleSize,
                      color: AppColors.white500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Dimensions.tellUsYourselfSubtitleToListSpacing),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: controller.journalingFrequencyOptions.map((option) {
                      return Obx(() {
                        final isSelected = controller.selectedJournalingFrequency.value == option;
                        return OptionButton(
                          text: option,
                          isSelected: isSelected,
                          onTap: () => controller.selectJournalingFrequency(option),
                        );
                      });
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: Dimensions.tellUsYourselfPageButtonSpacing),
          Obx(
            () => SizedBox(
              width: double.infinity,
              height: Dimensions.buttonHeight,
              child: ElevatedButton(
                onPressed: controller.canContinue()
                    ? controller.nextPage
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  disabledBackgroundColor:
                      AppColors.primaryColor.withValues(alpha: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimensions.heightSize),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Continue',
                  style: AppFonts.urbanistSemiBold(
                    fontSize: Dimensions.tellUsYourselfOptionSize,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: Dimensions.tellUsYourselfPageBottomSpacing),
        ],
      ),
    );
  }
}

// ==================== PAGE 6: JOURNALING OBSTACLE ====================
class JournalingObstaclePage extends StatelessWidget {
  final TellUsYourselfController controller;

  const JournalingObstaclePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: Dimensions.tellUsYourselfPageTopSpacing),
                  Text(
                    "What's stopping you\nfrom journaling?",
                    style: AppFonts.urbanistSemiBold(
                      fontSize: Dimensions.tellUsYourselfTitleSize,
                      color: AppColors.whiteColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Dimensions.tellUsYourselfTitleToSubtitleSpacing),
                  Text(
                    'This will be used to personalize your experience',
                    style: AppFonts.urbanistRegular(
                      fontSize: Dimensions.tellUsYourselfSubtitleSize,
                      color: AppColors.white500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Dimensions.tellUsYourselfSubtitleToListSpacing),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: controller.journalingObstacleOptions.map((option) {
                      return Obx(() {
                        final isSelected = controller.selectedJournalingObstacle.value == option;
                        return OptionButton(
                          text: option,
                          isSelected: isSelected,
                          onTap: () => controller.selectJournalingObstacle(option),
                        );
                      });
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: Dimensions.tellUsYourselfPageButtonSpacing),
          Obx(
            () => SizedBox(
              width: double.infinity,
              height: Dimensions.buttonHeight,
              child: ElevatedButton(
                onPressed: controller.canContinue()
                    ? controller.nextPage
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  disabledBackgroundColor:
                      AppColors.primaryColor.withValues(alpha: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimensions.heightSize),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Continue',
                  style: AppFonts.urbanistSemiBold(
                    fontSize: Dimensions.tellUsYourselfOptionSize,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: Dimensions.tellUsYourselfPageBottomSpacing),
        ],
      ),
    );
  }
}

// ==================== PAGE 7: GOAL ====================
class GoalPage extends StatelessWidget {
  final TellUsYourselfController controller;

  const GoalPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: Dimensions.tellUsYourselfPageTopSpacing),
                  Text(
                    'What would you like to\nachieve?',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: Dimensions.tellUsYourselfTitleSize,
                      color: AppColors.whiteColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Dimensions.tellUsYourselfTitleToSubtitleSpacing),
                  Text(
                    'This will be used to personalize your experience',
                    style: AppFonts.urbanistRegular(
                      fontSize: Dimensions.tellUsYourselfSubtitleSize,
                      color: AppColors.white500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Dimensions.tellUsYourselfSubtitleToListSpacing),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: controller.goalOptions.map((option) {
                      return Obx(() {
                        final isSelected = controller.selectedGoal.value == option;
                        return OptionButton(
                          text: option,
                          isSelected: isSelected,
                          onTap: () => controller.selectGoal(option),
                        );
                      });
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: Dimensions.tellUsYourselfPageButtonSpacing),
          Obx(
            () => SizedBox(
              width: double.infinity,
              height: Dimensions.buttonHeight,
              child: ElevatedButton(
                onPressed: controller.canContinue()
                    ? controller.nextPage
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  disabledBackgroundColor:
                      AppColors.primaryColor.withValues(alpha: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimensions.heightSize),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Continue',
                  style: AppFonts.urbanistSemiBold(
                    fontSize: Dimensions.tellUsYourselfOptionSize,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: Dimensions.tellUsYourselfPageBottomSpacing),
        ],
      ),
    );
  }
}

// ==================== PAGE 8: HEAR ABOUT US ====================
class HearAboutUsPage extends StatelessWidget {
  final TellUsYourselfController controller;

  const HearAboutUsPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: Dimensions.tellUsYourselfPageTopSpacing),
                  Text(
                    'Where did you hear\nabout us?',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: Dimensions.tellUsYourselfTitleSize,
                      color: AppColors.whiteColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Dimensions.tellUsYourselfTitleToSubtitleSpacing),
                  Text(
                    "We'd love to know how you found us Harbor",
                    style: AppFonts.urbanistRegular(
                      fontSize: Dimensions.tellUsYourselfSubtitleSize,
                      color: AppColors.white500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Dimensions.tellUsYourselfSubtitleToListSpacing),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: controller.hearOptions.map((option) {
                      return Obx(() {
                        final isSelected = controller.selectedHearAboutUs.value == option;
                        return OptionButton(
                          text: option,
                          isSelected: isSelected,
                          onTap: () => controller.selectHearAboutUs(option),
                        );
                      });
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: Dimensions.tellUsYourselfPageButtonSpacing),
          Obx(
            () => SizedBox(
              width: double.infinity,
              height: Dimensions.buttonHeight,
              child: ElevatedButton(
                onPressed: controller.canContinue()
                    ? controller.nextPage
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  disabledBackgroundColor:
                      AppColors.primaryColor.withValues(alpha: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimensions.heightSize),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Continue',
                  style: AppFonts.urbanistSemiBold(
                    fontSize: Dimensions.tellUsYourselfOptionSize,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: Dimensions.tellUsYourselfPageBottomSpacing),
        ],
      ),
    );
  }
}

// ==================== PAGE 4: BAD HABITS ====================
class BadHabitsPage extends StatelessWidget {
  final TellUsYourselfController controller;

  const BadHabitsPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: Dimensions.tellUsYourselfPageTopSpacing),
                  Text(
                    'Which bad habits would\nyou like to replace?',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: Dimensions.tellUsYourselfTitleSize,
                      color: AppColors.whiteColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Dimensions.tellUsYourselfTitleToSubtitleSpacing),
                  Text(
                    'This will be used to personalize your experience',
                    style: AppFonts.urbanistRegular(
                      fontSize: Dimensions.tellUsYourselfSubtitleSize,
                      color: AppColors.white500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Dimensions.tellUsYourselfSubtitleToListSpacing),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: controller.badHabitOptions.map((option) {
                      return Obx(() {
                        final isSelected = controller.selectedBadHabit.value == option;
                        return OptionButton(
                          text: option,
                          isSelected: isSelected,
                          onTap: () => controller.selectBadHabit(option),
                        );
                      });
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: Dimensions.tellUsYourselfPageButtonSpacing),
          Obx(
            () => SizedBox(
              width: double.infinity,
              height: Dimensions.buttonHeight,
              child: ElevatedButton(
                onPressed: controller.canContinue()
                    ? controller.nextPage
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  disabledBackgroundColor:
                      AppColors.primaryColor.withValues(alpha: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimensions.heightSize),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Continue',
                  style: AppFonts.urbanistSemiBold(
                    fontSize: Dimensions.tellUsYourselfOptionSize,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: Dimensions.tellUsYourselfPageBottomSpacing),
        ],
      ),
    );
  }
}

// ==================== PAGE 5: BELOVED CHILD ====================
class BelovedChildPage extends StatelessWidget {
  final TellUsYourselfController controller;

  const BelovedChildPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: Dimensions.tellUsYourselfPageTopSpacing),
                  Text(
                    'Beloved child of God\nwhy are you here?',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: Dimensions.tellUsYourselfTitleSize,
                      color: AppColors.whiteColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Dimensions.tellUsYourselfTitleToSubtitleSpacing),
                  Text(
                    'This will be used to personalize your experience',
                    style: AppFonts.urbanistRegular(
                      fontSize: Dimensions.tellUsYourselfSubtitleSize,
                      color: AppColors.white500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Dimensions.tellUsYourselfSubtitleToListSpacing),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: controller.belovedChildReasonOptions.map((option) {
                      return Obx(() {
                        final isSelected = controller.selectedBelovedChildReason.value == option;
                        return OptionButton(
                          text: option,
                          isSelected: isSelected,
                          onTap: () => controller.selectBelovedChildReason(option),
                        );
                      });
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: Dimensions.tellUsYourselfPageButtonSpacing),
          Obx(
            () => SizedBox(
              width: double.infinity,
              height: Dimensions.buttonHeight,
              child: ElevatedButton(
                onPressed: controller.canContinue()
                    ? controller.nextPage
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  disabledBackgroundColor:
                      AppColors.primaryColor.withValues(alpha: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimensions.heightSize),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Continue',
                  style: AppFonts.urbanistSemiBold(
                    fontSize: Dimensions.tellUsYourselfOptionSize,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: Dimensions.tellUsYourselfPageBottomSpacing),
        ],
      ),
    );
  }
}

// ==================== PAGE 12: GOAL GRAPH ====================
class GoalGraphPage extends StatelessWidget {
  final TellUsYourselfController controller;

  const GoalGraphPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: Dimensions.tellUsYourselfPageTopSpacing),
                  Text(
                    "You're closer to your\ngoal than you think.",
                    style: AppFonts.urbanistSemiBold(
                      fontSize: Dimensions.tellUsYourselfTitleSize,
                      color: AppColors.whiteColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 56.h),
                  // Graph image
                  Container(
                    height: 300.h,
                    child: Image.asset(
                      CustomAssets.ajibo_rekha,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 42.h),
                  Text(
                    "Based on HARBOR's data, it starts small but by\nDay 30, you'll feel the difference in how you\nthink and feel!",
                    style: AppFonts.urbanistRegular(
                      fontSize: Dimensions.tellUsYourselfSubtitleSize,
                      color: AppColors.white500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: Dimensions.heightSize),
          // Continue button - FIXED AT BOTTOM
          SizedBox(
            width: double.infinity,
            height: Dimensions.buttonHeight,
            child: ElevatedButton(
              onPressed: controller.nextPage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                side: BorderSide(
                  color: AppColors.primaryColor,
                  width: 2.w,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.heightSize),
                ),
                elevation: 0,
              ),
              child: Text(
                'Continue',
                style: AppFonts.urbanistSemiBold(
                  fontSize: Dimensions.tellUsYourselfOptionSize,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(height: Dimensions.tellUsYourselfPageBottomSpacing),
        ],
      ),
    );
  }
}


// ==================== PAGE 13: YOU'RE ALL SET ====================
class YoureAllSetPage extends StatelessWidget {
  final TellUsYourselfController controller;

  const YoureAllSetPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  // Celebration image
                  Image.asset(
                    CustomAssets.you_are_all_set,
                    width: 183.w,
                    height: 136.h,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 40.sp),
                  Text(
                    'How to reach your goals with Harbor',
                    style: AppFonts.urbanistMedium(
                      fontSize: 19.sp,
                      color: AppColors.white500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24.h),
                  // Features list
                  _buildFeatureItem(
                    number: '1',
                    title: 'AI Voice Calling & Journal Integration',
                    description: 'AI voice calls plus a journal for reflections with Bible verse.',
                  ),
                  SizedBox(height: 20.h),
                  _buildFeatureItem(
                    number: '2',
                    title: 'Track Moods with Bible Verses',
                    description: 'Users track their mood and link each emotion with Bible...',
                  ),
                  SizedBox(height: 20.h),
                  _buildFeatureItem(
                    number: '3',
                    title: 'Daily Plan to Stay on Track with Faith',
                    description: 'Provides daily devotional plan to keep users focused',
                  ),
                  SizedBox(height: 20.h),
                  _buildFeatureItem(
                    number: '4',
                    title: 'Personalized Biblical Advice',
                    description: 'Users can seek biblical guidance through the app',
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: Dimensions.heightSize),
          // Continue button
          SizedBox(
            width: double.infinity,
            height: Dimensions.buttonHeight,
            child: ElevatedButton(
              onPressed: controller.nextPage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                side: BorderSide(
                  color: AppColors.primaryColor,
                  width: 2.w,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.heightSize),
                ),
                elevation: 0,
              ),
              child: Text(
                'Continue',
                style: AppFonts.urbanistSemiBold(
                  fontSize: Dimensions.tellUsYourselfOptionSize,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(height: Dimensions.tellUsYourselfPageBottomSpacing),
        ],
      ),
    );
  }

  Widget _buildFeatureItem({
    required String number,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Number circle
        Container(
          width: 20.w,
          height: 20.h,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              number,
              style: AppFonts.urbanistSemiBold(
                fontSize: 10.sp,
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ),
        SizedBox(width: Dimensions.heightSize),
        // Text content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppFonts.urbanistSemiBold(
                  fontSize: 14.sp,
                  color: AppColors.whiteColor,
                ),
              ),
              SizedBox(height: Dimensions.heightSize / 2),
              Text(
                description,
                style: AppFonts.urbanistRegular(
                  fontSize: 12.sp,
                  color: AppColors.white500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ==================== PAGE 14: TRY HARBOR FOR FREE ====================
class WelcomeToHarborPage extends StatelessWidget {
  final TellUsYourselfController controller;

  const WelcomeToHarborPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background - use onBoardingImage
        Image.asset(
          CustomAssets.onBoardingImage,
          fit: BoxFit.cover,
        ),
        // Dark overlay for better readability
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withValues(alpha: 0.5),
                Colors.black.withValues(alpha: 0.8),
              ],
            ),
          ),
        ),
        // Content
        SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              // Title at top
              Text(
                'Try Harbor for free.',
                style: AppFonts.urbanistSemiBold(
                  fontSize: 22.sp,
                  color: AppColors.whiteColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              // Phone mockup with overlaid content
              Expanded(
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      // Phone mockup container (fixed size 299*602)
                      Container(
                        width: 299.w,
                        height: 602.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45.r),
                          border: Border.all(
                            color: Color(0xFF000000),
                            width: 12.w,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.5),
                              blurRadius: 30.r,
                              spreadRadius: 0,
                              offset: Offset(0, 10.h),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(38.r),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              // Phone screen - mountain background
                              Image.asset(
                                CustomAssets.backgroundImage,
                                fit: BoxFit.cover,
                                height: 30.h,
                                width: 30.w,
                              ),
                              // Status bar at top
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 44.h,
                                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '9:41',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.signal_cellular_4_bar, size: 14.sp, color: Colors.black),
                                          SizedBox(width: 3.w),
                                          Icon(Icons.wifi, size: 14.sp, color: Colors.black),
                                          SizedBox(width: 3.w),
                                          Icon(Icons.battery_full, size: 18.sp, color: Colors.black),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Harbor Logo OVER the phone (upper area)
                      Positioned(
                        top: 200.h,
                        child: SvgPicture.asset(
                          CustomAssets.splashLogo,
                          width: 70.w,
                          height: 70.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
        // "No Payment Due Now" and button OVER the entire interface (outside phone mockup)
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            width: 392.w,
            height: 264.h,
            padding: EdgeInsets.only(left: 20.w, top: 24.h, right: 20.w),
            decoration: BoxDecoration(
              color: Color(0xFF1A1A1A).withValues(alpha: 0.95),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.08),
                width: 0.5.w,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                    // No Payment Due Now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check,
                          color: AppColors.whiteColor,
                          size: 14.sp,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'No Payment Due Now',
                          style: AppFonts.urbanistMedium(
                            fontSize: 14.sp,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    // Try for $0.00 Button (outlined orange style)
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: 1.5.w,
                        ),
                        color: Colors.white.withValues(alpha: 0.03),
                      ),
                      child: TextButton(
                        onPressed: controller.nextPage,
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          backgroundColor: Colors.transparent,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'Try for \$0.00',
                          style: AppFonts.urbanistSemiBold(
                            fontSize: 14.sp,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    // Pricing details
                    Text(
                      '3 days free, then \$29.99 per year (\$2.49/mo)',
                      style: AppFonts.urbanistRegular(
                        fontSize: 14.sp,
                        color: AppColors.white500.withValues(alpha: 0.85),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
      ],
    );
  }
}

// ==================== PAGE 15: FREE TRIAL REMINDER ====================
class NotificationPermissionPage extends StatelessWidget {
  final TellUsYourselfController controller;

  const NotificationPermissionPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background - use onBoardingImage
        Image.asset(
          CustomAssets.onBoardingImage,
          fit: BoxFit.cover,
        ),
        // Dark overlay for better readability
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withValues(alpha: 0.5),
                Colors.black.withValues(alpha: 0.8),
              ],
            ),
          ),
        ),
        // Content
        SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 80.h),
                      // Title text
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.w),
                        child: Text(
                          'We\'ll send you a reminder\nbefore your free trial ends.',
                          style: AppFonts.urbanistSemiBold(
                            fontSize: 24.sp,
                            color: AppColors.whiteColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 60.h),
                      // Bell Icon
                      Image.asset(
                        CustomAssets.ring_bell,
                        width: 180.w,
                        height: 180.h,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ),
              // Bottom section - FIXED AT BOTTOM
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    // No Payment Due Now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check,
                          color: AppColors.whiteColor,
                          size: 14.sp,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'No Payment Due Now',
                          style: AppFonts.urbanistMedium(
                            fontSize: 14.sp,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    // Continue for Free Button
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: 2.w,
                        ),
                      ),
                      child: TextButton(
                        onPressed: controller.nextPage,
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          backgroundColor: Colors.transparent,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'Continue for Free',
                          style: AppFonts.urbanistSemiBold(
                            fontSize: 16.sp,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    // Pricing details
                    Text(
                      '3 days free, then \$29.99 per year (\$2.49/mo)',
                      style: AppFonts.urbanistRegular(
                        fontSize: 14.sp,
                        color: AppColors.white500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ],
    );
  }
}

// ==================== PAGE 16: StartThreeDayFreeTrial ====================
class StartThreeDaysFreePlanPage extends StatefulWidget {
  final TellUsYourselfController controller;
  const StartThreeDaysFreePlanPage({super.key, required this.controller});

  @override
  State<StartThreeDaysFreePlanPage> createState() => _StartThreeDaysFreePlanPageState();
}

class _StartThreeDaysFreePlanPageState extends State<StartThreeDaysFreePlanPage> {
  bool isMonthlySelected = false; // false means Yearly is selected by default

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background Image
        Image.asset(
          CustomAssets.onBoardingImage,
          fit: BoxFit.cover,
        ),
        // Overlay gradient
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withValues(alpha: 0.3),
                Colors.black.withValues(alpha: 0.6),
              ],
            ),
          ),
        ),
        // Content
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                // Title
                Text(
                  'Start your 3-day FREE\ntrial to continue.',
                  textAlign: TextAlign.left,
                  style: AppFonts.urbanistSemiBold(
                    fontSize: 24.sp,
                    color: AppColors.whiteColor,
                  ),
                ),
                SizedBox(height: 40.h),
                // Timeline items
                _TimelineItem(
                  icon: CustomAssets.today_icon,
                  title: 'Today',
                  subtitle: 'Unlock all features including AI calls and start your journey',
                ),
                SizedBox(height: 24.h),
                _TimelineItem(
                  icon: CustomAssets.ring_icon,
                  title: 'In 2 Days - Reminder',
                  subtitle: 'We\'ll send you a reminder that your trial is ending soon',
                ),
                SizedBox(height: 24.h),
                _TimelineItemThreeDays(
                  icon: CustomAssets.in_3_days_icon,
                  title: 'In 3 Days - Billing Starts',
                  subtitle: 'You\'ll be charged unless you cancel anytime before',
                ),
                SizedBox(height: 53.h),
                // Pricing cards
                Row(
                  children: [
                    // Monthly card
                    Expanded(
                      child: _PricingCard(
                        title: 'Monthly',
                        price: '\$9.99',
                        period: '/mo',
                        isSelected: isMonthlySelected,
                        onTap: () {
                          setState(() {
                            isMonthlySelected = true;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 12.w),
                    // Yearly card (selected by default)
                    Expanded(
                      child: _PricingCard(
                        title: 'Yearly',
                        price: '\$2.49',
                        period: '/mo',
                        isSelected: !isMonthlySelected,
                        badge: '3 Days Free',
                        onTap: () {
                          setState(() {
                            isMonthlySelected = false;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 80.h),
                // No Payment Due Now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check,
                      color: AppColors.whiteColor,
                      size: 14.sp,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'No Payment Due Now',
                      style: AppFonts.urbanistMedium(
                        fontSize: 12.sp,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                // Start Trial Button
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 2.w,
                      ),
                    ),
                    child: TextButton(
                      onPressed: widget.controller.nextPage,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      child: Text(
                        'Start My 3-Day Free Trial',
                        textAlign: TextAlign.center,
                        style: AppFonts.urbanistSemiBold(
                          fontSize: 16.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                // Pricing info
                Center(
                  child: Text(
                    '3 days free, then \$29.99 per year (\$2.49/mo)',
                    textAlign: TextAlign.center,
                    style: AppFonts.urbanistRegular(
                      fontSize: 12.sp,
                      color: AppColors.white500,
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Timeline Item Widget
class _TimelineItem extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;

  const _TimelineItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon container
        Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Center(
            child: SvgPicture.asset(
              icon,
              width: 32.w,
              height: 32.h,

            ),
          ),
        ),
        SizedBox(width: 12.w),
        // Text content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppFonts.urbanistSemiBold(
                  fontSize: 14.sp,
                  color: AppColors.whiteColor,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                subtitle,
                style: AppFonts.urbanistRegular(
                  fontSize: 10.sp,
                  color: AppColors.white500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TimelineItemThreeDays extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;

  const _TimelineItemThreeDays({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon container
        Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.white500,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Center(
            child: SvgPicture.asset(
              icon,
              width: 32.w,
              height: 32.h,

            ),
          ),
        ),
        SizedBox(width: 12.w),
        // Text content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppFonts.urbanistSemiBold(
                  fontSize: 14.sp,
                  color: AppColors.whiteColor,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                subtitle,
                style: AppFonts.urbanistRegular(
                  fontSize: 10.sp,
                  color: AppColors.white500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
// Pricing Card Widget
class _PricingCard extends StatelessWidget {
  final String title;
  final String price;
  final String period;
  final bool isSelected;
  final String? badge;
  final VoidCallback onTap;

  const _PricingCard({
    required this.title,
    required this.price,
    required this.period,
    required this.isSelected,
    this.badge,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.whiteColor
                  : Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: isSelected
                    ? AppColors.primaryColor
                    : Colors.white.withValues(alpha: 0.2),
                width: isSelected ? 2.w : 1.w,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and radio button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: AppFonts.urbanistSemiBold(
                        fontSize: 14.sp,
                        color: isSelected
                            ? Colors.black
                            : AppColors.whiteColor,
                      ),
                    ),
                    Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primaryColor
                              : AppColors.white500,
                          width: 2.w,
                        ),
                      ),
                      child: isSelected
                          ? Center(
                              child: Container(
                                width: 10.w,
                                height: 10.h,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            )
                          : null,
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                // Price
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      price,
                      style: AppFonts.urbanistBold(
                        fontSize: 28.sp,
                        color: isSelected
                            ? Colors.black
                            : AppColors.whiteColor,
                      ),
                    ),
                    Text(
                      period,
                      style: AppFonts.urbanistMedium(
                        fontSize: 14.sp,
                        color: isSelected
                            ? Colors.black
                            : AppColors.white500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Badge
          if (badge != null)
            Positioned(
              top: -10.h,
              right: 10.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  badge!,
                  style: AppFonts.urbanistSemiBold(
                    fontSize: 12.sp,
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
// ==================== PAGE 11: HARVOR 5X ====================
class Harvor5xPage extends StatelessWidget {
  final TellUsYourselfController controller;

  const Harvor5xPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: Dimensions.heightSize * 2),
                  Text(
                    'Harvor creates 5x more\naccountable habits',
                    style: AppFonts.urbanistSemiBold(
                      fontSize: Dimensions.tellUsYourselfTitleSize,
                      color: AppColors.whiteColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 80.h),
                  // Comparison bars
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Row 1: Containers
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 40.h,
                            width: 109.w,
                            decoration: BoxDecoration(
                              color: AppColors.darkGrayColor,
                              borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                            ),
                          ),
                          Container(
                            height: 181.h,
                            width: 109.w,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Dimensions.heightSize),
                      // Row 2: Labels
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 109.w,
                            child: Text(
                              'Without Harvor',
                              style: AppFonts.urbanistRegular(
                                fontSize: Dimensions.tellUsYourselfHarvorwithandwithout,
                                color: AppColors.whiteColor,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            width: 109.w,
                            child: Text(
                              'With Harvor',
                              style: AppFonts.urbanistRegular(
                                fontSize: Dimensions.tellUsYourselfHarvorwithandwithout,
                                color: AppColors.whiteColor,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Dimensions.iconSizeSmall / 2),
                      // Row 3: Percentages
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 109.w,
                            child: Text(
                              '10%',
                              style: AppFonts.urbanistSemiBold(
                                fontSize: Dimensions.tellUsYourselfHarvorpercentSize,
                                color: AppColors.grayColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            width: 109.w,
                            child: Text(
                              '5x',
                              style: AppFonts.urbanistSemiBold(
                                fontSize: Dimensions.tellUsYourselfHarvorpercentSize,
                                color: AppColors.primaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    'Harbor makes it easy to keep your\njournaling habit',
                    style: AppFonts.urbanistMedium(
                      fontSize: Dimensions.tellUsYourselfSubtitleSize,
                      color: AppColors.white500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: Dimensions.heightSize),
          // Continue button
          SizedBox(
            width: double.infinity,
            height: Dimensions.buttonHeight,
            child: ElevatedButton(
              onPressed: controller.nextPage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                side: BorderSide(
                  color: AppColors.primaryColor,
                  width: 2.w,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.heightSize),
                ),
                elevation: 0,
              ),
              child: Text(
                'Continue',
                style: AppFonts.urbanistSemiBold(
                  fontSize: Dimensions.tellUsYourselfOptionSize,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(height: Dimensions.heightSize),
        ],
      ),
    );
  }
}

// ==================== PLACEHOLDER PAGE ====================
class PlaceholderPage extends StatelessWidget {
  final int pageNumber;

  const PlaceholderPage({super.key, required this.pageNumber});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Page $pageNumber',
            style: AppFonts.urbanistSemiBold(
              fontSize: Dimensions.headingTextSize1 * 1.33,
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(height: Dimensions.marginBetweenInputBox),
          Text(
            'Coming soon...',
            style: AppFonts.urbanistRegular(
              fontSize: Dimensions.headingTextSize3,
              color: AppColors.white500,
            ),
          ),
          SizedBox(height: Dimensions.paddingSize * 1.67),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize),
            child: SizedBox(
              width: double.infinity,
              height: Dimensions.buttonHeight,
              child: ElevatedButton(
                onPressed: () {
                  Get.find<TellUsYourselfController>().nextPage();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimensions.heightSize),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Continue',
                  style: AppFonts.urbanistSemiBold(
                    fontSize: Dimensions.headingTextSize3,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== REUSABLE OPTION BUTTON WIDGET ====================
class OptionButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const OptionButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.iconSizeLarge - 4,
          vertical: Dimensions.tellUsYourselfOptionButtonVerticalPadding,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.whiteColor : Colors.transparent,
          borderRadius: BorderRadius.circular(Dimensions.heightSize),
          border: isSelected
              ? Border.all(
                  color: AppColors.primaryColor,
                  width: 2.w,
                )
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: AppFonts.urbanistSemiBold(
                fontSize: Dimensions.tellUsYourselfOptionSize,
                color:
                    isSelected ? AppColors.primaryColor : AppColors.whiteColor,
              ),
            ),
            if (isSelected)
              SvgPicture.asset(
                CustomAssets.signatureIcon,
                width: Dimensions.tellUsYourselfOptionSize,
                height: Dimensions.tellUsYourselfOptionSize,
              ),
          ],
        ),
      ),
    );
  }
}

// ==================== PAGE 16: ONE TIME OFFER ====================
class OneTimeOfferPage extends StatelessWidget {
  final TellUsYourselfController controller;

  const OneTimeOfferPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background Image
        Image.asset(
          CustomAssets.tellUsYourselfLastPageBackground,
          fit: BoxFit.cover,
        ),
        // Dark gradient overlay
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withValues(alpha: 0.35),
                Colors.black.withValues(alpha: 0.85),
              ],
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                // Top row with close button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => context.go('/home'),
                      child: Container(
                        width: 32.w,
                        height: 32.h,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                         child: Icon(Icons.close,
                              color: AppColors.whiteColor,
                              size: 20.sp),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 28.h),
                // Title
                Text(
                  'Your one-time offer',
                  style: AppFonts.urbanistSemiBold(
                    fontSize: 28.sp,
                    color: AppColors.whiteColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.h),
                // White pill with discount
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 54.w, vertical: 26.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '80% OFF',
                        style: AppFonts.urbanistBold(
                          fontSize: 24.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Text(
                        'FOREVER',
                        style: AppFonts.urbanistBold(
                          fontSize: 24.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                // Price row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$29.99',
                      style: AppFonts.urbanistSemiBold(
                        fontSize: 24.sp,
                        color: AppColors.white500,
                      ).copyWith(
                        decoration: TextDecoration.lineThrough,
                        decorationColor: AppColors.primaryColor,
                        decorationThickness: 1.9,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      '\$1.66/mo',
                      style: AppFonts.urbanistBold(
                        fontSize: 40.sp,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
                // Bullet list with icons
                _OfferBulletRow(
                  icon: CustomAssets.coffee_icon,
                  text: 'Less than a coffee.',
                ),
                SizedBox(height: 16.h),
                _OfferBulletRow(
                  icon: CustomAssets.close_icon,
                  text: 'Close this screen? This price is gone.',
                ),
                SizedBox(height: 16.h),
                _OfferBulletRow(
                  icon: CustomAssets.people_icon,
                  text: 'What are you waiting for?',
                ),
                Spacer(),
                // No payment due now small row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check, color: Colors.white70, size: 16.sp),
                    SizedBox(width: 8.w),
                    Text(
                      'No Payment Due Now',
                      style: AppFonts.urbanistMedium(
                        fontSize: 14.sp,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                // CTA button
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 2.w,
                      ),
                    ),
                    child: TextButton(
                      onPressed: () => context.go(AppPath.home),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      child: Text(
                        'Start My 3-Day Free Trial',
                        style: AppFonts.urbanistSemiBold(
                          fontSize: 16.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  '3 days free, then \$29.99 per year (\$2.49/mo)',
                  style: AppFonts.urbanistRegular(
                    fontSize: 12.sp,
                    color: AppColors.white500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Small reusable bullet row widget for offer page
class _OfferBulletRow extends StatelessWidget {
  final String icon;
  final String text;
  const _OfferBulletRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 42.w,
          height: 42.h,
          decoration: BoxDecoration(
         //   color: Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Center(
            child: SvgPicture.asset(
              icon,
              width: 28.w,
              height: 28.h,


            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            text,
            style: AppFonts.urbanistRegular(
              fontSize: 16.sp,
              color: AppColors.white500,
            ),
          ),
        ),
      ],
    );
  }
}

