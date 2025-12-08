import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../core/custom_assets/custom_assets.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_fonts/app_fonts.dart';
import 'nav_bar_controller.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final NavBarController controller = Get.put(NavBarController());

    return Obx(
      () => Container(
        height: 80.h,
        decoration: BoxDecoration(
          color: AppColors.blackLightColor,
          border: Border(
            top: BorderSide(
              color: AppColors.primaryColor.withValues(alpha: 0.2),
              width: 1.w,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavBarItem(
              icon: CustomAssets.home_nav,
              hoverIcon: CustomAssets.home_hover_nav,
              label: 'Home',
              index: 0,
              isSelected: controller.selectedIndex.value == 0,
              onTap: () => controller.changeIndex(0),
            ),
            _NavBarItem(
              icon: CustomAssets.journal_nav,
              hoverIcon: CustomAssets.journal_hover_nav,
              label: 'Journal',
              index: 1,
              isSelected: controller.selectedIndex.value == 1,
              onTap: () => controller.changeIndex(1),
            ),
            _NavBarItem(
              icon: CustomAssets.chatbot_nav,
              hoverIcon: CustomAssets.chatbot_hover_nav,
              label: 'AI',
              index: 2,
              isSelected: controller.selectedIndex.value == 2,
              onTap: () => controller.changeIndex(2),
            ),
            _NavBarItem(
              icon: CustomAssets.bible_nav,
              hoverIcon: CustomAssets.bible_hover_nav,
              label: 'The Bible',
              index: 3,
              isSelected: controller.selectedIndex.value == 3,
              onTap: () => controller.changeIndex(3),
            ),
            _NavBarItem(
              icon: CustomAssets.profile_nav,
              hoverIcon: CustomAssets.profile_hover_nav,
              label: 'Profile',
              index: 4,
              isSelected: controller.selectedIndex.value == 4,
              onTap: () => controller.changeIndex(4),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String icon;
  final String hoverIcon;
  final String label;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.icon,
    required this.hoverIcon,
    required this.label,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70.w,
        height: 70.h,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              isSelected ? hoverIcon : icon,
              width: 24.w,
              height: 24.h,
            ),
            SizedBox(height: 4.h),
            SizedBox(
              height: 18.h,
              child: Align(
                alignment: Alignment.topCenter,
                child: AnimatedOpacity(
                  opacity: isSelected ? 1 : 0,
                  duration: const Duration(milliseconds: 150),
                  child: Text(
                    label,
                    style: AppFonts.urbanistMedium(
                      fontSize: 10.sp,
                      color: AppColors.primaryColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
