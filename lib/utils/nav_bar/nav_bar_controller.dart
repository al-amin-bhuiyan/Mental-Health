import 'package:get/get.dart';

class NavBarController extends GetxController {
  // Observable for the current selected index
  var selectedIndex = 0.obs;

  // Method to change the selected index
  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  // Method to get the current route based on index
  String getCurrentRoute() {
    switch (selectedIndex.value) {
      case 0:
        return '/home';
      case 1:
        return '/journal';
      case 2:
        return '/chatbot';
      case 3:
        return '/bible';
      case 4:
        return '/profile';
      default:
        return '/home';
    }
  }
}

