import 'package:get/get.dart';

class LanguageController extends GetxController {
  // The reactive variable that will hold the current selected language
  var selectedLanguage = 'English'.obs;  // Initially set to English

  // Method to change the selected language
  void changeLanguage(String language) {
    selectedLanguage.value = language;  // Update the language
  }
}
