import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TellUsYourselfController extends GetxController {
  // Current page index
  final RxInt currentPage = 0.obs;
  final int totalPages = 14;

  // User data
  final RxString selectedGender = ''.obs;
  final RxString selectedAgeRange = ''.obs;
  final RxString selectedPrayerRelationship = ''.obs;
  final RxString selectedJournalingApps = ''.obs;
  final RxString selectedJournalingFrequency = ''.obs;
  final RxString selectedJournalingObstacle = ''.obs;
  final RxString selectedGoal = ''.obs;
  final RxString selectedHearAboutUs = ''.obs;

  // Additional data fields for other pages
  final RxString selectedMentalHealthGoal = ''.obs;
  final RxString selectedStressLevel = ''.obs;
  final RxString selectedSleepQuality = ''.obs;
  final RxString selectedExerciseFrequency = ''.obs;
  final RxString selectedSupportSystem = ''.obs;
  final RxString selectedTherapyExperience = ''.obs;
  final RxString selectedEmotionalState = ''.obs;
  final RxString selectedCopingMechanism = ''.obs;
  final RxString selectedMedicationUse = ''.obs;
  final RxString selectedTriggers = ''.obs;
  final RxString selectedLifeEvents = ''.obs;

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

  bool canContinue() {
    switch (currentPage.value) {
      case 0:
        return selectedGender.value.isNotEmpty;
      case 1:
        return selectedAgeRange.value.isNotEmpty;
      case 2:
        return selectedPrayerRelationship.value.isNotEmpty;
      case 3:
        return selectedJournalingApps.value.isNotEmpty;
      case 4:
        return selectedJournalingFrequency.value.isNotEmpty;
      case 5:
        return selectedJournalingObstacle.value.isNotEmpty;
      case 6:
        return selectedGoal.value.isNotEmpty;
      case 7:
        return selectedHearAboutUs.value.isNotEmpty;
      default:
        return true;
    }
  }

  double getProgress() {
    return (currentPage.value + 1) / totalPages;
  }

  void completeOnboarding() {
    // Save user data and navigate to home
    print('Onboarding completed!');
    print('Gender: ${selectedGender.value}');
    print('Age Range: ${selectedAgeRange.value}');
    print('Prayer Relationship: ${selectedPrayerRelationship.value}');
    print('Journaling Apps: ${selectedJournalingApps.value}');
    print('Journaling Frequency: ${selectedJournalingFrequency.value}');
    print('Journaling Obstacle: ${selectedJournalingObstacle.value}');
    print('Goal: ${selectedGoal.value}');
    print('Heard About Us: ${selectedHearAboutUs.value}');


    // Navigate to home screen
    Get.snackbar(
      'Success',
      'Profile completed successfully!',
      backgroundColor: Colors.green.withValues(alpha: 0.9),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );

    // TODO: Navigate to home screen
    // context.go(AppPath.home);
  }
}

