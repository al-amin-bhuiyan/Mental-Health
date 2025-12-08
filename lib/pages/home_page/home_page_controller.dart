import 'package:get/get.dart';

class HomePageController extends GetxController {
  // Observable variables
  var isLoading = false.obs;
  var userName = 'User'.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  void loadUserData() {
    // Load user data logic here
    userName.value = 'Beloved Child';
  }

  @override
  void onClose() {
    super.onClose();
  }
}

