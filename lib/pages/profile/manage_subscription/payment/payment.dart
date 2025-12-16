import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/custom_assets/custom_assets.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_fonts/app_fonts.dart';
import 'payment_controller.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentController controller = Get.put(
      PaymentController(),
      tag: 'payment',
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(CustomAssets.onBoardingImage),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // App Bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColors.whiteColor,
                          size: 20.sp,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Payment',
                          style: AppFonts.urbanistBold(
                            fontSize: 20.sp,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 40.w),
                  ],
                ),
              ),

              // Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),

                      // Select payment method title
                      Text(
                        'Select your payment method',
                        style: AppFonts.urbanistSemiBold(
                          fontSize: 16.sp,
                          color: AppColors.whiteColor,
                        ),
                      ),

                      SizedBox(height: 16.h),

                      // Payment method cards (this is where _buildPaymentMethods is used)
                      _buildPaymentMethods(controller),

                      SizedBox(height: 16.h),

                      // Add New button
                      ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 12.h,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        icon: Icon(
                          Icons.add,
                          color: AppColors.whiteColor,
                          size: 18.sp,
                        ),
                        label: Text(
                          'Add New',
                          style: AppFonts.urbanistBold(
                            fontSize: 14.sp,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),

                      SizedBox(height: 24.h),
                      Text(
                        'Select your payment method',
                        style: AppFonts.urbanistRegular(
                          fontSize: 14.sp,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      // Description text
                      Text(
                        'Add your payment method to your Google Account to complete your purchase',
                        style: AppFonts.urbanistRegular(
                          fontSize: 13.sp,
                          color: AppColors.whiteColor,
                        ),
                      ),

                      SizedBox(height: 24.h),

                      // Card Holder Name
                      Text(
                        'Card Holder Name',
                        style: AppFonts.urbanistSemiBold(
                          fontSize: 14.sp,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: TextField(
                          controller: controller.cardHolderNameController,
                          style: AppFonts.urbanistRegular(
                            fontSize: 14.sp,
                            color: AppColors.whiteColor,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Your pet name',
                            hintStyle: AppFonts.urbanistRegular(
                              fontSize: 14.sp,
                              color: AppColors.grayColor,
                            ),
                            prefixIcon: Icon(
                              Icons.credit_card,
                              color: AppColors.grayColor,
                              size: 20.sp,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 14.h,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20.h),

                      // Card Name
                      Text(
                        'Card Name',
                        style: AppFonts.urbanistSemiBold(
                          fontSize: 14.sp,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      SizedBox(height: 8.h),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: TextField(
                        controller: controller.cardNumberController,
                        style: AppFonts.urbanistRegular(
                          fontSize: 14.sp,
                          color: AppColors.whiteColor,
                        ),
                        decoration: InputDecoration(
                          hintText: '!@#\$%&*^',
                          hintStyle: AppFonts.urbanistRegular(
                            fontSize: 14.sp,
                            color: AppColors.grayColor,
                          ),
                          // Correctly using the SvgPicture asset for the prefixIcon
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w), // Optional: Add horizontal padding if needed
                            child: SvgPicture.asset(
                              CustomAssets.card_icon, // Ensure that this path is correct
                              width: 20.w,  // You can adjust the width and height as needed
                              height: 20.h,
                            ),
                          ),
                          border: InputBorder.none, // Optional: remove the border if you want a cleaner look
                        ),
                      ),
                    ),

                      SizedBox(height: 20.h),

                      // Valid Until and CVV
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Valid Until',
                                  style: AppFonts.urbanistSemiBold(
                                    fontSize: 14.sp,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: TextField(
                                    controller: controller.validUntilController,
                                    style: AppFonts.urbanistRegular(
                                      fontSize: 14.sp,
                                      color: AppColors.whiteColor,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'Month/Year',
                                      hintStyle: AppFonts.urbanistRegular(
                                        fontSize: 14.sp,
                                        color: AppColors.grayColor,
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 16.w,
                                        vertical: 14.h,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'CVV',
                                  style: AppFonts.urbanistSemiBold(
                                    fontSize: 14.sp,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: TextField(
                                    controller: controller.cvvController,
                                    obscureText: true,
                                    style: AppFonts.urbanistRegular(
                                      fontSize: 14.sp,
                                      color: AppColors.whiteColor,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: '****',
                                      hintStyle: AppFonts.urbanistRegular(
                                        fontSize: 14.sp,
                                        color: AppColors.whiteColor,
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 16.w,
                                        vertical: 14.h,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 16.h),

                      // Save card checkbox
                      Obx(() => Row(
                        children: [
                          SizedBox(
                            width: 20.w,
                            height: 20.h,
                            child: Checkbox(
                              value: controller.saveCardForFuture.value,
                              onChanged: controller.toggleSaveCard,
                              activeColor: AppColors.primaryColor,
                              checkColor: AppColors.whiteColor,
                              side: BorderSide(
                                color: AppColors.grayColor,
                                width: 1.w,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'Save card data for future payments',
                            style: AppFonts.urbanistRegular(
                              fontSize: 13.sp,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      )),

                      SizedBox(height: 32.h),

                      // Process button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => controller.processPayment(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          child: Text(
                            'Process To confirm',
                            style: AppFonts.urbanistBold(
                              fontSize: 16.sp,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethods(PaymentController controller) {
    List<String> paymentMethods = [
      'stripe', 'visa', 'paypal', 'amex', 'mastercard', 'discover'
    ];

    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.start ,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: paymentMethods.map((method) {
        return _buildPaymentCard(method, controller);
      }).toList(),
    ));
  }

// Build individual payment card for each method
  Widget _buildPaymentCard(String method, PaymentController controller) {
    final isSelected = controller.selectedPaymentMethod.value == method;
    String imagePath = '';

    switch (method) {
      case 'stripe':
        imagePath = CustomAssets.stripe_image;
        break;
      case 'visa':
        imagePath = CustomAssets.visa_image;
        break;
      case 'paypal':
        imagePath = CustomAssets.pay_pal_image;
        break;
      case 'amex':
        imagePath = CustomAssets.amex_image;
        break;
      case 'mastercard':
        imagePath = CustomAssets.master_card_image;
        break;
      case 'discover':
        imagePath = CustomAssets.discover;
        break;
      default:
        imagePath = CustomAssets.stripe_image; // Default image
    }

    return GestureDetector(
      onTap: () => controller.selectPaymentMethod(method),
      child: Container(
        width: 55.w,
        height: 38.h,
       margin: EdgeInsets.zero,  // Increased horizontal spacing
     //   padding: EdgeInsets.all(10.h),  // Add 10.h padding inside each card
        
        child: Center(
          child: Image.asset(
            imagePath,
            width: 55 .w,  // Set the size of the payment method logo
            height: 38.h,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

}
