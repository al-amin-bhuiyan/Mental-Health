import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_fonts/app_fonts.dart';

/// Generic Card Widget for displaying items with image background
///
/// This is a reusable component that follows OOP principles:
/// - Generic type T for flexible item types
/// - Customizable icon, title, and callback
/// - Gradient overlay for better text visibility over images
class GenericCardWidget<T> extends StatelessWidget {
  final T item;
  final String backgroundImage;
  final String iconPath;
  final String title;
  final VoidCallback onTap;
  final double height;
  final double cornerRadius;
  final double iconSize;
  final double titleFontSize;

  const GenericCardWidget({
    Key? key,
    required this.item,
    required this.backgroundImage,
    required this.iconPath,
    required this.title,
    required this.onTap,
    this.height = 120,
    this.cornerRadius = 16,
    this.iconSize = 28,
    this.titleFontSize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cornerRadius.r),
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(cornerRadius.r),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.black.withValues(alpha: 0.3),
                Colors.black.withValues(alpha: 0.5),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Icon Container
                Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      iconPath,
                      width: iconSize.w,
                      height: iconSize.h,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 16.w),

                // Title
                Expanded(
                  child: Text(
                    title,
                    style: AppFonts.urbanistBold(
                      fontSize: titleFontSize.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),

                // Navigation Arrow
                Icon(
                  Icons.chevron_right,
                  color: AppColors.whiteColor,
                  size: 24.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

