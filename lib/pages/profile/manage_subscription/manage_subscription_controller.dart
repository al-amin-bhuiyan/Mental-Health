import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ManageSubscriptionController extends GetxController {
  // Observable for selected plan
  var selectedPlan = ''.obs;

  // Subscription plans
  final List<SubscriptionPlan> plans = [
    SubscriptionPlan(
      name: 'Monthly Plan',
      description: 'High acquisition, entry funnel to upsell',
      price: '\$9.99',
      period: '/ month',
      planType: 'monthly',
    ),
    SubscriptionPlan(
      name: 'Yearly Plan',
      description: 'High acquisition, entry funnel to upsell',
      price: '\$2.49',
      period: '/ month',
      planType: 'yearly',
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    // Load current subscription if available
    loadCurrentSubscription();
  }

  // Load current subscription
  void loadCurrentSubscription() {
    // TODO: Load from API or local storage
    // For now, no plan selected
    selectedPlan.value = '';
  }

  // Purchase plan
  void purchasePlan(String planType, BuildContext context) {
    // Navigate to payment page
    context.push('/payment');
  }

  // Check if plan is selected
  bool isPlanSelected(String planType) {
    return selectedPlan.value == planType;
  }
}

// Subscription plan model
class SubscriptionPlan {
  final String name;
  final String description;
  final String price;
  final String period;
  final String planType;

  SubscriptionPlan({
    required this.name,
    required this.description,
    required this.price,
    required this.period,
    required this.planType,
  });
}

