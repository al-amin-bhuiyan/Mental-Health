import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TellUsYourselfController extends GetxController {
  // Current page index
  final RxInt currentPage = 0.obs;
  final int totalPages = 19;

  // User data
  final RxString selectedGender = ''.obs;
  final RxString selectedAgeRange = ''.obs;
  final RxString selectedPrayerRelationship = ''.obs;
  final RxString selectedBadHabit = ''.obs;
  final RxString selectedBelovedChildReason = ''.obs;
  final RxString selectedJournalingApps = ''.obs;
  final RxString selectedJournalingFrequency = ''.obs;
  final RxString selectedJournalingObstacle = ''.obs;
  final RxString selectedGoal = ''.obs;
  final RxString selectedHearAboutUs = ''.obs;



  // Gender options
  final List<String> genderOptions = [
    'Male',
    'Female',
    'Others',
  ];

  // Age range options
  final List<String> ageRangeOptions = [
    'Under 18',
    '18 - 24',
    '25 - 34',
    '35 - 44',
    '45 - 54',
    '55+',
    'Prefer not to say',
  ];

  // Prayer relationship options
  final List<String> prayerRelationshipOptions = [
    'Everyday',
    'Once a week',
    'Occasionally',
    'I want to learn',
    'Not for me',
  ];

  // Bad habits options
  final List<String> badHabitOptions = [
    'Scrolling social media',
    'Watching the news',
    'Worrying too much',
    'Drugs/Alcohol',
    'Procrastination',
    'None of these',
  ];

  // Beloved child reasons options
  final List<String> belovedChildReasonOptions = [
    'Draw close to God',
    'Under His Bible',
    'Learn to pray',
    'Improve habits',
    "I'm Lonely",
    'Rather sleep',
    'Reduce anxiety',
  ];

  // Journaling apps options
  final List<String> journalingAppsOptions = [
    'No',
    'Yes',
  ];

  // Journaling frequency options
  final List<String> journalingFrequencyOptions = [
    'Everyday',
    'A few times a week',
    'Once a week',
    'Rarely',
    'Never tried it',
  ];

  // Journaling obstacles options
  final List<String> journalingObstacleOptions = [
    'No time-need busy',
    "Don't know what to write",
    'Too tired',
    'Forget and lose consistency',
    'Never see real benefit',
  ];

  // Goals options
  final List<String> goalOptions = [
    'More mental clarity',
    'Better self-awareness',
    'Personal growth',
    'Stay on track',
    'Reduce stress and anxiety',
  ];
  final List<String> hearOptions =[
    'Youtube',
    'Facebook',
    'Instagram',
    'Tiktok',
    'X (Twitter)',
    'Reddit',

  ];

  void nextPage() {
    if (currentPage.value < totalPages - 1) {
      currentPage.value++;
    } else {
      // Complete onboarding
      completeOnboarding();
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      currentPage.value--;
    }
  }

  void selectGender(String gender) {
    selectedGender.value = gender;
  }

  void selectAgeRange(String ageRange) {
    selectedAgeRange.value = ageRange;
  }

  void selectPrayerRelationship(String relationship) {
    selectedPrayerRelationship.value = relationship;
  }

  void selectBadHabit(String habit) {
    selectedBadHabit.value = habit;
  }

  void selectBelovedChildReason(String reason) {
    selectedBelovedChildReason.value = reason;
  }

  void selectJournalingApps(String option) {
    selectedJournalingApps.value = option;
  }

  void selectJournalingFrequency(String frequency) {
    selectedJournalingFrequency.value = frequency;
  }

  void selectJournalingObstacle(String obstacle) {
    selectedJournalingObstacle.value = obstacle;
  }

  void selectGoal(String goal) {
    selectedGoal.value = goal;
  }
  void selectHearAboutUs(String option) {
    selectedHearAboutUs.value = option;
  }

  // Reset all selections (useful for testing or restarting onboarding)
  void resetOnboarding() {
    currentPage.value = 0;
    selectedGender.value = '';
    selectedAgeRange.value = '';
    selectedPrayerRelationship.value = '';
    selectedBadHabit.value = '';
    selectedBelovedChildReason.value = '';
    selectedJournalingApps.value = '';
    selectedJournalingFrequency.value = '';
    selectedJournalingObstacle.value = '';
    selectedGoal.value = '';
    selectedHearAboutUs.value = '';
  }

  // Get all user data as a map (useful for saving to database)
  Map<String, String> getUserData() {
    return {
      'gender': selectedGender.value,
      'ageRange': selectedAgeRange.value,
      'prayerRelationship': selectedPrayerRelationship.value,
      'badHabit': selectedBadHabit.value,
      'belovedChildReason': selectedBelovedChildReason.value,
      'triedJournalingApps': selectedJournalingApps.value,
      'journalingFrequency': selectedJournalingFrequency.value,
      'journalingObstacle': selectedJournalingObstacle.value,
      'goal': selectedGoal.value,
      'heardAboutUs': selectedHearAboutUs.value,
    };
  }

  bool canContinue() {
    switch (currentPage.value) {
      case 0:
        return selectedGender.value.isNotEmpty;
      case 1:
        return selectedAgeRange.value.isNotEmpty;
      case 2:
        return selectedPrayerRelationship.value.isNotEmpty;
      case 3:
        return selectedBadHabit.value.isNotEmpty;
      case 4:
        return selectedBelovedChildReason.value.isNotEmpty;
      case 5:
        return selectedJournalingApps.value.isNotEmpty;
      case 6:
        return selectedJournalingFrequency.value.isNotEmpty;
      case 7:
        return selectedJournalingObstacle.value.isNotEmpty;
      case 8:
        return selectedGoal.value.isNotEmpty;
      case 9:
        return selectedHearAboutUs.value.isNotEmpty;
      default:
        return true;
    }
  }

  double getProgress() {
    // Progress bar shows only for pages 0-12 (13 pages total)
    // After page 12 (YoureAllSetPage), progress bar is hidden
    const progressBarPages = 13;
    return (currentPage.value + 1) / progressBarPages;
  }

  void completeOnboarding() {
    // Save user data and navigate to home
    print('====== Onboarding Completed! ======');
    print('Gender: ${selectedGender.value}');
    print('Age Range: ${selectedAgeRange.value}');
    print('Prayer Relationship: ${selectedPrayerRelationship.value}');
    print('Bad Habit: ${selectedBadHabit.value}');
    print('Beloved Child Reason: ${selectedBelovedChildReason.value}');
    print('Tried Other Journaling Apps: ${selectedJournalingApps.value}');
    print('Journaling Frequency: ${selectedJournalingFrequency.value}');
    print('Journaling Obstacle: ${selectedJournalingObstacle.value}');
    print('Goal: ${selectedGoal.value}');
    print('Heard About Us: ${selectedHearAboutUs.value}');
    print('===================================');

    // Show success message
    Get.snackbar(
      'Success',
      'Profile completed successfully!',
      backgroundColor: Colors.green.withValues(alpha: 0.9),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
    );

    // TODO: Save data to database/storage
    // TODO: Navigate to home screen
    // context.go(AppPath.home);
  }
}

