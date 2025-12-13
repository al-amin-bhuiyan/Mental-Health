import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class NavBarController extends GetxController {
  // Observable for the current selected index
  var selectedIndex = 0.obs;

  // Method to change the selected index and navigate
  void changeIndex(int index, BuildContext context) {
    selectedIndex.value = index;

    // Navigate based on index
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/journal');
        break;
      case 2:
        context.go('/chat');
        break;
      case 3:
        // Bible page - to be implemented
        break;
      case 4:
        context.go('/profile');
        break;
    }
  }

  // Method to get the current route based on index
  String getCurrentRoute() {
    switch (selectedIndex.value) {
      case 0:
        return '/home';
      case 1:
        return '/journal';
      case 2:
        return '/chat';
      case 3:
        return '/bible';
      case 4:
        return '/profile';
      default:
        return '/home';
    }
  }
}

