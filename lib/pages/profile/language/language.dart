import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mental_health/core/custom_assets/custom_assets.dart';
import 'package:mental_health/utils/app_colors/app_colors.dart';

import '../../../utils/app_fonts/app_fonts.dart';

/// Design-only widget that reproduces the provided "Change Language" screen.
/// Static (no interaction) — shows English selected as in the screenshot.
class LanguagePage extends StatelessWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cardHeight = size.height * 0.36;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background image (replace with your asset)
          Positioned.fill(
            child: Image.asset(
              CustomAssets.onBoardingImage,
              fit: BoxFit.cover,
            ),
          ),

          // Dark overlay to match screenshot tone
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.35)),
          ),

          // Global blur like the reference
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
              child: Container(color: Colors.transparent),
            ),
          ),


          // Bottom modal-like card (design-only)
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                  child: Container(
                    height: cardHeight,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.78),
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Colors.white.withOpacity(0.04)),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
                    child: Column(
                      children: [
                        // Drag indicator
                        Container(
                          width: 48,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.55),
                            borderRadius: BorderRadius.circular(7.r),
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Title & subtitle
                        Text(
                          'Choose your language',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Changing the language will initiate a restart',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.65),
                            fontSize: 13,
                          ),
                        ),

                        const SizedBox(height: 18),

                        // Two circular language options (static: English selected)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            _StaticLanguageCircle(
                              label: 'Hello',
                              subLabel: 'English',
                              selected: true,
                            ),
                            _StaticLanguageCircle(
                              label: 'Hola',
                              subLabel: 'Spanish',
                              selected: false,
                            ),
                          ],
                        ),

                        const Spacer(),

                        // Save button (visual only)
                        SizedBox(
                          width: double.infinity,
                          height: 48.h,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              padding: EdgeInsets.symmetric(vertical: 16.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            child: Text(
                              'Save',
                              style: AppFonts.urbanistBold(
                                fontSize: 16.sp,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StaticLanguageCircle extends StatelessWidget {
  final String label;
  final String subLabel;
  final bool selected;

  const _StaticLanguageCircle({
    Key? key,
    required this.label,
    required this.subLabel,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double outer = 92.0;
    const double inner = 72.0;
    const double check = 28.0;

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: outer,
              height: outer,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withOpacity(0.76),
                  width: 1.2,
                ),
              ),
              alignment: Alignment.center,
              child: Container(
                width: inner,
                height: inner,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.35),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            if (selected)
              Positioned(
                right: outer * 0.03,
                top: outer * 0.03,
                child: Container(
                  width: check,
                  height: check,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF8A00),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white.withOpacity(0.06), width: 1),
                  ),
                  child: const Icon(
                    Icons.check,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          subLabel,
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}