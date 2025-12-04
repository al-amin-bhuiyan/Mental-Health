import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../core/custom_assets/custom_assets.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_fonts/app_fonts.dart';
import 'verification_code_controller.dart';

class VerificationCodeScreen extends StatelessWidget {
  final bool showTitle;

  const VerificationCodeScreen({super.key, this.showTitle = true});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerificationCodeController());

    // Set navigation source based on showTitle parameter
    controller.setNavigationSource(showTitle);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            CustomAssets.onBoardingImage,
            fit: BoxFit.cover,
          ),
          // Overlay gradient for better text visibility
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.3),
                  Colors.black.withValues(alpha: 0.6),
                ],
              ),
            ),
          ),
          // Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  // Back button aligned to the left
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () => context.pop(),
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColors.whiteColor,
                          size: 20,
                        ),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                  // Title - conditional based on navigation source
                  if (showTitle) ...[
                    Text(
                      'Verification code',
                      style: AppFonts.urbanistSemiBold(
                        fontSize: 28,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                  // Subtitle
                  Text(
                    'Please enter the code we just sent to your email',
                    style: AppFonts.urbanistRegular(
                      fontSize: 14,
                      color: AppColors.white500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),
                  // OTP Input Fields
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        6,
                        (index) => Container(
                          width: 40,
                          height: 40,
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: controller.otpValues[index].isNotEmpty
                                  ? AppColors.primaryColor
                                  : AppColors.white500.withValues(alpha: 0.4),
                              width: 2,
                            ),
                            color: Colors.white.withValues(alpha: 0.1),
                          ),
                          alignment: Alignment.center,
                          child: TextField(
                            controller: controller.otpControllers[index],
                            focusNode: controller.focusNodes[index],
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            style: AppFonts.urbanistSemiBold(
                              fontSize: 22,
                              color: AppColors.whiteColor,
                              height: 1.0,
                            ),
                            decoration: const InputDecoration(
                              counterText: '',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                              isDense: true,
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (value) {
                              controller.onOtpChanged(index, value);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Didn't receive OTP? Resend Code
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't receive OTP?",
                        style: AppFonts.urbanistRegular(
                          fontSize: 14,
                          color: AppColors.white500,
                        ),
                      ),
                      const SizedBox(width: 4),
                      TextButton(
                        onPressed: controller.resendCode,
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'Resend Code',
                          style: AppFonts.urbanistSemiBold(
                            fontSize: 14,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  // Verify Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () => controller.verifyCode(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Verify',
                        style: AppFonts.urbanistSemiBold(
                          fontSize: 16,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

