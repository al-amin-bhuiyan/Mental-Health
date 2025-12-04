import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../core/custom_assets/custom_assets.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_fonts/app_fonts.dart';
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
                            width: 40,
                            height: 40,
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
                          const SizedBox(width: 47),
                          SizedBox(
                            width: 195,
                            child: Obx(
                              () => ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: LinearProgressIndicator(
                                  value: controller.getProgress(),
                                  backgroundColor: AppColors.white500,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColors.primaryColor,
                                  ),
                                  minHeight: 8,
                                ),
                              ),
                            ),
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
                        return JournalingAppsPage(controller: controller);
                      case 4:
                        return JournalingFrequencyPage(controller: controller);
                      case 5:
                        return JournalingObstaclePage(controller: controller);
                      case 6:
                        return GoalPage(controller: controller);
                      case 7:
                        return HearAboutUsPage(controller: controller);
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
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(height: 44),
          // Title
          Text(
            "What's Your Gender?",
            style: AppFonts.urbanistSemiBold(
              fontSize: 32,
              color: AppColors.whiteColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          // Subtitle
          Text(
            'This will be used to personalize your experience',
            style: AppFonts.urbanistRegular(
              fontSize: 14,
              color: AppColors.white500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          // Gender options
          Obx(() => Column(
                children: controller.genderOptions.map((gender) {
                  final isSelected = controller.selectedGender.value == gender;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: OptionButton(
                      text: gender,
                      isSelected: isSelected,
                      onTap: () => controller.selectGender(gender),
                    ),
                  );
                }).toList(),
              )),
          const Spacer(),
          // Continue button
          Obx(
            () => SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: controller.canContinue()
                    ? controller.nextPage
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  disabledBackgroundColor:
                      AppColors.primaryColor.withValues(alpha: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Continue',
                  style: AppFonts.urbanistSemiBold(
                    fontSize: 16,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
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
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(height: 44),
          // Title
          Text(
            "What's your age range?",
            style: AppFonts.urbanistSemiBold(
              fontSize: 32,
              color: AppColors.whiteColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          // Subtitle
          Text(
            'This will be used to personalize your experience',
            style: AppFonts.urbanistRegular(
              fontSize: 14,
              color: AppColors.white500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          // Age range options
          Obx(() => Column(
                children: controller.ageRangeOptions.map((ageRange) {
                  final isSelected =
                      controller.selectedAgeRange.value == ageRange;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: OptionButton(
                      text: ageRange,
                      isSelected: isSelected,
                      onTap: () => controller.selectAgeRange(ageRange),
                    ),
                  );
                }).toList(),
              )),
          const Spacer(),
          // Continue button
          Obx(
            () => SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: controller.canContinue()
                    ? controller.nextPage
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  disabledBackgroundColor:
                      AppColors.primaryColor.withValues(alpha: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Continue',
                  style: AppFonts.urbanistSemiBold(
                    fontSize: 16,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
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
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(height: 44),
          // Title
          Text(
            'What is your relationship\nwith Prayer?',
            style: AppFonts.urbanistSemiBold(
              fontSize: 32,
              color: AppColors.whiteColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12) ,
          // Subtitle
          Text(
            'This will be used to personalize your experience',
            style: AppFonts.urbanistRegular(
              fontSize: 14,
              color: AppColors.white500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          // Prayer relationship options
          Obx(() => Column(
                children: controller.prayerRelationshipOptions.map((option) {
                  final isSelected =
                      controller.selectedPrayerRelationship.value == option;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: OptionButton(
                      text: option,
                      isSelected: isSelected,
                      onTap: () => controller.selectPrayerRelationship(option),
                    ),
                  );
                }).toList(),
              )),
          const Spacer(),
          // Continue button
          Obx(
            () => SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: controller.canContinue()
                    ? controller.nextPage
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  disabledBackgroundColor:
                      AppColors.primaryColor.withValues(alpha: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Continue',
                  style: AppFonts.urbanistSemiBold(
                    fontSize: 16,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
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
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(height: 44),
          // Title
          Text(
            'Have you tried other\njournaling apps?',
            style: AppFonts.urbanistSemiBold(
              fontSize: 32,
              color: AppColors.whiteColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          // Subtitle
          Text(
            'This will be used to personalize your experience',
            style: AppFonts.urbanistRegular(
              fontSize: 14,
              color: AppColors.white500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          // Journaling apps options
          Obx(() => Column(
                children: controller.journalingAppsOptions.map((option) {
                  final isSelected =
                      controller.selectedJournalingApps.value == option;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: OptionButton(
                      text: option,
                      isSelected: isSelected,
                      onTap: () => controller.selectJournalingApps(option),
                    ),
                  );
                }).toList(),
              )),
          const Spacer(),
          // Continue button
          Obx(
            () => SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: controller.canContinue()
                    ? controller.nextPage
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  disabledBackgroundColor:
                      AppColors.primaryColor.withValues(alpha: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Continue',
                  style: AppFonts.urbanistSemiBold(
                    fontSize: 16,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
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
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(height: 44),
          // Title
          Text(
            'How often do you journal?',
            style: AppFonts.urbanistSemiBold(
              fontSize: 32,
              color: AppColors.whiteColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          // Subtitle
          Text(
            'This will be used to personalize your experience',
            style: AppFonts.urbanistRegular(
              fontSize: 14,
              color: AppColors.white500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          // Journaling frequency options
          Obx(() => Column(
                children: controller.journalingFrequencyOptions.map((option) {
                  final isSelected =
                      controller.selectedJournalingFrequency.value == option;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: OptionButton(
                      text: option,
                      isSelected: isSelected,
                      onTap: () => controller.selectJournalingFrequency(option),
                    ),
                  );
                }).toList(),
              )),
          const Spacer(),
          // Continue button
          Obx(
            () => SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: controller.canContinue()
                    ? controller.nextPage
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  disabledBackgroundColor:
                      AppColors.primaryColor.withValues(alpha: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Continue',
                  style: AppFonts.urbanistSemiBold(
                    fontSize: 16,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
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
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(height: 44),
          // Title
          Text(
            "What's stopping you\nfrom journaling?",
            style: AppFonts.urbanistSemiBold(
              fontSize: 32,
              color: AppColors.whiteColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          // Subtitle
          Text(
            'This will be used to personalize your experience',
            style: AppFonts.urbanistRegular(
              fontSize: 14,
              color: AppColors.white500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          // Journaling obstacle options
          Obx(() => Column(
                children: controller.journalingObstacleOptions.map((option) {
                  final isSelected =
                      controller.selectedJournalingObstacle.value == option;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: OptionButton(
                      text: option,
                      isSelected: isSelected,
                      onTap: () => controller.selectJournalingObstacle(option),
                    ),
                  );
                }).toList(),
              )),
          const Spacer(),
          // Continue button
          Obx(
            () => SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: controller.canContinue()
                    ? controller.nextPage
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  disabledBackgroundColor:
                      AppColors.primaryColor.withValues(alpha: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Continue',
                  style: AppFonts.urbanistSemiBold(
                    fontSize: 16,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
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
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(height: 44),
          // Title
          Text(
            'What would you like to\nachieve?',
            style: AppFonts.urbanistSemiBold(
              fontSize: 32,
              color: AppColors.whiteColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          // Subtitle
          Text(
            'This will be used to personalize your experience',
            style: AppFonts.urbanistRegular(
              fontSize: 14,
              color: AppColors.white500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          // Goal options
          Obx(() => Column(
                children: controller.goalOptions.map((option) {
                  final isSelected =
                      controller.selectedGoal.value == option;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: OptionButton(
                      text: option,
                      isSelected: isSelected,
                      onTap: () => controller.selectGoal(option),
                    ),
                  );
                }).toList(),
              )),
          const Spacer(),
          // Continue button
          Obx(
            () => SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: controller.canContinue()
                    ? controller.nextPage
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  disabledBackgroundColor:
                      AppColors.primaryColor.withValues(alpha: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Continue',
                  style: AppFonts.urbanistSemiBold(
                    fontSize: 16,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
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
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(height: 44),
          // Title
          Text(
            'Where did you hear\nabout us?',
            style: AppFonts.urbanistSemiBold(
              fontSize: 32,
              color: AppColors.whiteColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          // Subtitle
          Text(
            "We'd love to know how you found us Harbor",
            style: AppFonts.urbanistRegular(
              fontSize: 14,
              color: AppColors.white500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          // Hear about us options
          Obx(() => Column(
                children: controller.hearOptions.map((option) {
                  final isSelected =
                      controller.selectedHearAboutUs.value == option;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: OptionButton(
                      text: option,
                      isSelected: isSelected,
                      onTap: () => controller.selectHearAboutUs(option),
                    ),
                  );
                }).toList(),
              )),
          const Spacer(),
          // Continue button
          Obx(
            () => SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: controller.canContinue()
                    ? controller.nextPage
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  disabledBackgroundColor:
                      AppColors.primaryColor.withValues(alpha: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Continue',
                  style: AppFonts.urbanistSemiBold(
                    fontSize: 16,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
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
              fontSize: 32,
              color: AppColors.whiteColor,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Coming soon...',
            style: AppFonts.urbanistRegular(
              fontSize: 16,
              color: AppColors.white500,
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Get.find<TellUsYourselfController>().nextPage();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Continue',
                  style: AppFonts.urbanistSemiBold(
                    fontSize: 16,
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.whiteColor : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
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
                fontSize: 16,
                color:
                    isSelected ? AppColors.primaryColor : AppColors.whiteColor,
              ),
            ),
            if (isSelected)
              SvgPicture.asset(
                CustomAssets.signatureIcon,
                width: 16,
                height: 16,
              ),
          ],
        ),
      ),
    );
  }
}

