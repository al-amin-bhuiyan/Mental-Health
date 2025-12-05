import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
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
                // Top section with back button and progress
                Padding(
                  padding: const EdgeInsets.all(20.0),
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
          Expanded(
            child: Column(
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
          Expanded(
            child: Column(
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
          Expanded(
            child: Column(
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
          Expanded(
            child: Column(
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
          Expanded(
            child: Column(
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
          Expanded(
            child: Column(
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
          Expanded(
            child: Column(
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
          Expanded(
            child: Column(
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
          Expanded(
            child: Column(
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
          Expanded(
            child: Column(
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
          Expanded(
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
          SizedBox(height: 101.h),
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
                  width: 2,
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
          SizedBox(height:24.h),
          // Features list
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
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
          SizedBox(height: 60.sp),
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
                  width: 2,
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
          SizedBox(height: Dimensions.heightSize * 2),
          Text(
            'Harvor creates 5x more\naccountable habits',
            style: AppFonts.urbanistSemiBold(
              fontSize: Dimensions.tellUsYourselfTitleSize,
              color: AppColors.whiteColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Dimensions.heightSize),
          // Comparison bars
          Expanded(
            child: Column(
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
          ),
          SizedBox(height: Dimensions.heightSize),
          Text(
            'Harbor makes it easy to keep your\njournaling habit',
            style: AppFonts.urbanistMedium(
              fontSize: Dimensions.tellUsYourselfSubtitleSize,
              color: AppColors.white500,
            ),
            textAlign: TextAlign.center,
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
                  width: 2,
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
          vertical: Dimensions.marginBetweenInputBox,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.whiteColor : Colors.transparent,
          borderRadius: BorderRadius.circular(Dimensions.heightSize),
          border: isSelected
              ? Border.all(
                  color: AppColors.primaryColor,
                  width: 2,
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
