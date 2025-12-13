import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class WriteJournalController extends GetxController {
  // Text editing controllers
  final titleController = TextEditingController();
  final reflectionController = TextEditingController();

  // Image picker
  final ImagePicker _picker = ImagePicker();
  Rx<File?> selectedImage = Rx<File?>(null);

  // Selected mood
  RxString selectedMood = ''.obs;

  // Initial data from navigation
  String? initialVerse;
  String? initialReference;
  String? initialMood;

  @override
  void onInit() {
    super.onInit();
    // Initialize with passed data if available
    if (initialVerse != null && initialReference != null) {
      titleController.text = initialReference ?? '';
      reflectionController.text = initialVerse ?? '';
    }
    if (initialMood != null) {
      selectedMood.value = initialMood!;
    }
  }

  // Method to set initial data
  void setInitialData({
    String? verse,
    String? reference,
    String? mood,
  }) {
    initialVerse = verse;
    initialReference = reference;
    initialMood = mood;

    if (verse != null && reference != null) {
      titleController.text = reference;
      reflectionController.text = verse;
    }
    if (mood != null) {
      selectedMood.value = mood;
    }
  }

  // Select mood
  void selectMood(String mood) {
    selectedMood.value = mood;
  }

  // Pick image from gallery
  Future<void> pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (image != null) {
        selectedImage.value = File(image.path);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to pick image: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // Remove selected image
  void removeImage() {
    selectedImage.value = null;
  }

  // Save journal entry
  void saveJournal({VoidCallback? onSaved}) {
    if (titleController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter a title for your journal',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (reflectionController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please write your reflection',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // TODO: Save journal entry to database or API
    Get.snackbar(
      'Success',
      'Journal entry saved successfully!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

    // Call the callback if provided
    if (onSaved != null) {
      onSaved();
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    reflectionController.dispose();
    super.onClose();
  }
}

