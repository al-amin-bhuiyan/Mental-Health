import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dimensions {
  // dynamic screen size
  static double screenWidth = 1.sw;
  static double screenHeight = 1.sh;

  // padding and margin
  static double paddingSize = 24.h;
  static double marginBetweenInputTitleAndBox = 8.h;
  static double marginBetweenInputBox = 16.h;
  static double marginSizeHorizontal = 24.w;
  static double marginSizeVertical = 24.h;
  static double marginSizeBetweenColumn = 16.w;

  // widget size
  static double buttonHeight = 56.h;
  static double inputBoxHeight = 56.h;
  static double appBarHeight = 64.4.h;

  // icon size
  static double iconSizeSmall = 8.h;
  static double iconSizeDefault = 16.h;
  static double iconSizeLarge = 24.h;

  // typography
  static double headingTextSize1 = 24.sp;
  static double headingTextSize2 = 20.sp;
  static double headingTextSize3 = 16.sp;
  static double headingTextSize4 = 14.sp;
  static double headingTextSize5 = 12.sp;
  static double headingTextSize6 = 10.sp;

  // Tell us yourself page specific sizes
  static double tellUsYourselfTopSpacing = 28.h;  // Top spacing from back button/progress (reduced for small devices)
  static double tellUsYourselfTitleSize = 28.sp;  // Title font size
  static double tellUsYourselfTitleToSubtitleSpacing = 8.h;  // Spacing between title and subtitle
  static double tellUsYourselfSubtitleSize = 14.sp;
  static double tellUsYourselfOptionSize = 16.sp;
  static double tellUsYourselfOptionButtonVerticalPadding = 12.h;  // Reduced vertical padding for option buttons

  static double tellUsYourselfHarvordOptionspace = 24.sp;
  static double tellUsYourselfHarvorBarSideMargin = 55.5.w;
  static double tellUsYourselfHarvorpercentSize = 24.sp;
  static double tellUsYourselfHarvorwithandwithout = 14.w;

  // Universal consistent spacing for ALL tell_us_yourself pages (prevents overflow on small devices)
  static double tellUsYourselfPageTopSpacing = 12.h;            // Top spacing for ALL pages (reduced for small devices)
  static double tellUsYourselfPageBottomSpacing = 4.h;          // Bottom spacing for ALL pages (reduced for small devices)
  static double tellUsYourselfPageButtonSpacing = 6.h;          // Spacing before button for ALL pages (reduced)

  // Fixed spacing between subtitle and list items for all pages
  static double tellUsYourselfSubtitleToListSpacing = 24.h;     // Spacing between subtitle and list (reduced for small devices)
  static double tellUsYourselfBetweenListItemSpacing = 24.h;    // Spacing between list items (reduced, scales with device)

  // font sizes based on width breakpoints
  static double getFontSizeSmall() =>
      screenWidth >= 1300 ? 15.sp : 12.sp;
  static double getFontSizeSemiSmall() =>
      screenWidth >= 1300 ? 15.sp : 13.sp;
  static double getFontSizeDefault() =>
      screenWidth >= 1300 ? 17.sp : 14.sp;
  static double getFontSizeLarge() =>
      screenWidth >= 1300 ? 20.sp : 16.sp;
  static double getFontSizeExtraLarge() =>
      screenWidth >= 1300 ? 20.sp : 18.sp;

  static double getButtonFontSize() =>
      screenWidth >= 1300 ? 26.sp : 20.sp;
  static double getButtonFontSizeLarge() =>
      screenWidth >= 1300 ? 30.sp : 24.sp;

  static double getFontSizeOverLarge() =>
      screenWidth >= 1300 ? 56.sp : 46.sp;

  // radius
  static double radius = 10.r;
  static double radiusSmall = 5.r;
  static double radiusDefault = 16.r;
  static double radiusLarge = 20.r;
  static double radiusExtraLarge = 32.r;
  static double radiusExtraMoreLarge = 50.r;

  // default height and width size
  static double heightSize = 12.h;
  static double widthSize = 10.w;
}
