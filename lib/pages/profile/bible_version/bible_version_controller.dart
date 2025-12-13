import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BibleVersionController extends GetxController {
  // Observable for selected bible version
  var selectedVersion = 'New International Version (NIV)'.obs;

  // List of bible versions
  final List<BibleVersion> bibleVersions = [
    BibleVersion(
      name: 'New International Version (NIV)',
      abbreviation: 'NIV',
    ),
    BibleVersion(
      name: 'World English Bible (WEB)',
      abbreviation: 'WEB',
    ),
    BibleVersion(
      name: 'King James Version (KJV)',
      abbreviation: 'KJV',
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    // Load saved version from storage if available
    loadSavedVersion();
  }

  // Load saved version
  void loadSavedVersion() {
    // TODO: Load from SharedPreferences or local storage
    // For now, default is NIV
    selectedVersion.value = 'New International Version (NIV)';
  }

  // Select version
  void selectVersion(String version, BuildContext context) {
    selectedVersion.value = version;
    // TODO: Save to SharedPreferences or local storage

    // Show success message
    Get.snackbar(
      'Bible Version Updated',
      'Selected: $version',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFFE27000),
      colorText: const Color(0xFFFFFFFF),
      duration: const Duration(seconds: 2),
    );

    // Navigate back after a short delay
    Future.delayed(const Duration(milliseconds: 800), () {
      context.pop();
    });
  }

  // Check if version is selected
  bool isSelected(String version) {
    return selectedVersion.value == version;
  }
}

// Bible Version model
class BibleVersion {
  final String name;
  final String abbreviation;

  BibleVersion({
    required this.name,
    required this.abbreviation,
  });
}

