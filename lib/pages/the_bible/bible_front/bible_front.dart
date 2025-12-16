import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/custom_assets/custom_assets.dart';
import '../../../core/widgets/generic_card_widget.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_fonts/app_fonts.dart';
import '../../../utils/nav_bar/nav_bar.dart';
import '../models/bible_book_model.dart';
import 'bible_front_controller.dart';

class BibleFrontPage extends StatelessWidget {
  const BibleFrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    final BibleFrontController controller = Get.put(BibleFrontController());

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
              // Header
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Text(
                  'The Bible',
                  style: AppFonts.urbanistBold(
                    fontSize: 24.sp,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),

              // Bible Books List
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      SizedBox(height: 8.h),
                      ...List.generate(
                        controller.bibleBooks.length,
                        (index) {
                          final book = controller.bibleBooks[index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 16.h),
                            child: GenericCardWidget<BibleBook>(
                              item: book,
                              backgroundImage: book.backgroundImage,
                              iconPath: book.bookIcon,
                              title: book.title,
                              onTap: () => controller.navigateToBibleBook(
                                context,
                                book.title,
                              ),
                              height: 120,
                              cornerRadius: 16,
                              iconSize: 28,
                              titleFontSize: 20,
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 100.h), // Space for nav bar
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}

