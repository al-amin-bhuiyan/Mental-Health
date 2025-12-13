import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../utils/app_colors/app_colors.dart';

class EditProfileController extends GetxController {
  // Text editing controllers
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController locationController;

  // Observable for profile image
  var profileImageUrl = ''.obs;

  // Initialize with user name
  String initialUserName = '';

  // Track if already initialized
  var isInitialized = false.obs;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController(text: 'tharashremlin@gmail.com');
    locationController = TextEditingController(text: 'London, UK');
  }

  // Initialize with passed data
  void initializeData(String userName) {
    if (!isInitialized.value) {
      initialUserName = userName;
      nameController.text = userName;
      isInitialized.value = true;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    locationController.dispose();
    super.onClose();
  }

  // Change profile picture
  void changeProfilePicture() {
    // TODO: Implement image picker
    Get.snackbar(
      'Change Profile Picture',
      'Image picker will be implemented',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primaryColor,
      colorText: AppColors.whiteColor,
    );
  }

  // Save profile
  void saveProfile(BuildContext context) {
    // TODO: Implement save profile API call
    // Validate fields
    if (nameController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Name cannot be empty',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: AppColors.whiteColor,
      );
      return;
    }

    if (emailController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Email cannot be empty',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: AppColors.whiteColor,
      );
      return;
    }

    // Show success message
    Get.snackbar(
      'Success',
      'Profile updated successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primaryColor,
      colorText: AppColors.whiteColor,
    );

    // Navigate back
    context.pop();
  }
}

