import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../utils/app_colors/app_colors.dart';

class PaymentController extends GetxController {
  // Text editing controllers
  late TextEditingController cardHolderNameController;
  late TextEditingController cardNumberController;
  late TextEditingController validUntilController;
  late TextEditingController cvvController;

  // Observable for selected payment method
  var selectedPaymentMethod = 'mastercard'.obs;

  // Observable for save card checkbox
  var saveCardForFuture = false.obs;

  // Payment methods
  final List<PaymentMethod> paymentMethods = [
    PaymentMethod(name: 'Stripe', icon: 'stripe', id: 'stripe'),
    PaymentMethod(name: 'Visa', icon: 'visa', id: 'visa'),
    PaymentMethod(name: 'PayPal', icon: 'paypal', id: 'paypal'),
    PaymentMethod(name: 'Amex', icon: 'amex', id: 'amex'),
    PaymentMethod(name: 'Mastercard', icon: 'mastercard', id: 'mastercard'),
    PaymentMethod(name: 'Discover', icon: 'discover', id: 'discover'),
  ];

  @override
  void onInit() {
    super.onInit();
    cardHolderNameController = TextEditingController();
    cardNumberController = TextEditingController();
    validUntilController = TextEditingController();
    cvvController = TextEditingController();

    // Set default card number display
    cardNumberController.text = '!@#\$%&^*';
  }

  @override
  void onClose() {
    cardHolderNameController.dispose();
    cardNumberController.dispose();
    validUntilController.dispose();
    cvvController.dispose();
    super.onClose();
  }

  // Select payment method
  void selectPaymentMethod(String method) {
    selectedPaymentMethod.value = method;
  }

  // Toggle save card
  void toggleSaveCard(bool? value) {
    saveCardForFuture.value = value ?? false;
  }

  // Process payment
  void processPayment(BuildContext context) {
    // Validate fields
    if (cardHolderNameController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter card holder name',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: AppColors.whiteColor,
      );
      return;
    }

    if (validUntilController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter valid until date',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: AppColors.whiteColor,
      );
      return;
    }

    if (cvvController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter CVV',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: AppColors.whiteColor,
      );
      return;
    }

    // TODO: Implement actual payment gateway integration
    Get.snackbar(
      'Processing Payment',
      'Please wait...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primaryColor,
      colorText: AppColors.whiteColor,
    );

    // Simulate payment processing
    Future.delayed(const Duration(seconds: 2), () {
      Get.snackbar(
        'Payment Successful',
        'Your subscription has been activated!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.primaryColor,
        colorText: AppColors.whiteColor,
      );

      // Navigate back to profile
      Future.delayed(const Duration(milliseconds: 800), () {
        context.go('/profile');
      });
    });
  }
}

// Payment method model
class PaymentMethod {
  final String name;
  final String icon;
  final String id;

  PaymentMethod({
    required this.name,
    required this.icon,
    required this.id,
  });
}

