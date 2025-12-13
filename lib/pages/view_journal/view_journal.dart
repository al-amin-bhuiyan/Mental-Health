import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:mental_health/core/app_route/app_path.dart';
import '../../core/custom_assets/custom_assets.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_fonts/app_fonts.dart';
import '../../utils/nav_bar/nav_bar.dart';
import 'view_journal_controller.dart';

class ViewJournalPage extends StatelessWidget {
  const ViewJournalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ViewJournalController());

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            CustomAssets.onBoardingImage,
            fit: BoxFit.cover,
          ),

          // Main Content
          SafeArea(
            child: Column(
              children: [
                // Header
                _buildHeader(context),

                // Scrollable Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 21.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),

                        // Today's Prompt Card
                        _buildTodaysPromptCard(context),

                        SizedBox(height: 16.h),

                        // AI Voice Call Reminder
                        _buildVoiceCallReminder(context),

                        SizedBox(height: 20.h),

                        // Recent Journal Entries Header
                        Text(
                          'Recent Journal Entries',
                          style: AppFonts.urbanistBold(
                            fontSize: 16.sp,
                            color: AppColors.whiteColor,
                          ),
                        ),

                        SizedBox(height: 12.h),

                        // Search Bar
                        _buildSearchBar(),

                        SizedBox(height: 16.h),

                        // Journal Entry Cards
                        Obx(() => ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.journalEntries.length,
                          separatorBuilder: (context, index) => SizedBox(height: 12.h),
                          itemBuilder: (context, index) {
                            final entry = controller.journalEntries[index];
                            return _buildJournalEntryCard(
                              title: entry['title'] as String,
                              mood: entry['mood'] as String,
                              content: entry['content'] as String,
                              timestamp: entry['timestamp'] as String,
                              hasImage: entry['hasImage'] as bool,
                              index: index,
                              isOlder: false,
                              context: context,
                            );
                          },
                        )),

                        SizedBox(height: 16.h),

                        // See More Button for Recent Entries
                        Center(
                          child: TextButton(
                            onPressed: () {
                              // Load more recent entries
                            },
                            child: Text(
                              'See More',
                              style: AppFonts.urbanistSemiBold(
                                fontSize: 14.sp,
                                color: AppColors.white500,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 24.h),

                        // Older Journal Entries Header
                        Text(
                          'Older Journal Entries',
                          style: AppFonts.urbanistBold(
                            fontSize: 16.sp,
                            color: AppColors.whiteColor,
                          ),
                        ),

                        SizedBox(height: 16.h),

                        // Older Journal Entry Cards
                        Obx(() => ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.olderJournalEntries.length,
                          separatorBuilder: (context, index) => SizedBox(height: 12.h),
                          itemBuilder: (context, index) {
                            final entry = controller.olderJournalEntries[index];
                            return _buildOlderJournalEntryCard(
                              title: entry['title'] as String,
                              mood: entry['mood'] as String,
                              content: entry['content'] as String,
                              timestamp: entry['timestamp'] as String,
                              hasImage: entry['hasImage'] as bool,
                              index: index,
                              isOlder: true,
                              context: context,
                            );
                          },
                        )),

                        SizedBox(height: 100.h), // Space for nav bar
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Center(
        child: Text(
          'Journal',
          style: AppFonts.urbanistBold(
            fontSize: 18.sp,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }

  Widget _buildTodaysPromptCard(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(
          image: AssetImage(CustomAssets.today_s_prompt),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withValues(alpha: 0.3),
              Colors.black.withValues(alpha: 0.6),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '📝',
                  style: TextStyle(fontSize: 16.sp),
                ),
                SizedBox(width: 8.w),
                Text(
                  'Today\'s Prompt',
                  style: AppFonts.urbanistBold(
                    fontSize: 14.sp,
                    color: AppColors.whiteColor,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.more_vert,
                  color: AppColors.whiteColor,
                  size: 20.sp,
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              'What made you smile today?',
              style: AppFonts.urbanistMedium(
                fontSize: 12.sp,
                color: AppColors.white500,
              ),
            ),
            SizedBox(height: 12.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to add journal page
                  context.push('/addJournal');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF8C00),
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  'Write Freely',
                  style: AppFonts.urbanistBold(
                    fontSize: 14.sp,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVoiceCallReminder(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to Voice Call Reminder page
        context.push(AppPath.voiceCallReminder);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white.withValues(alpha: 0.15),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.2),
            width: 1.w,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: Color(0xFFFF8C00).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                Icons.phone_in_talk,
                color: Color(0xFFFF8C00),
                size: 20.sp,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AI Voice Call Reminder',
                    style: AppFonts.urbanistBold(
                      fontSize: 14.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Schedule your daily check-in',
                    style: AppFonts.urbanistMedium(
                      fontSize: 12.sp,
                      color: AppColors.white500,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.white500,
              size: 16.sp,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    final controller = Get.find<ViewJournalController>();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
          width: 1.w,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: AppColors.white500,
            size: 20.sp,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: TextField(
              controller: controller.searchController,
              style: AppFonts.urbanistMedium(
                fontSize: 12.sp,
                color: AppColors.whiteColor,
              ),
              decoration: InputDecoration(
                hintText: 'Search by word... (example: Happy)',
                hintStyle: AppFonts.urbanistMedium(
                  fontSize: 12.sp,
                  color: AppColors.white500,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                isDense: true,
              ),
              onChanged: (value) {
                // TODO: Call API to search journals
                controller.searchJournalEntries(value);
              },
              onSubmitted: (value) {
                // TODO: Call API to search journals on submit
                controller.searchJournalEntries(value);
              },
            ),
          ),
          Obx(() {
            if (controller.searchQuery.value.isNotEmpty) {
              return GestureDetector(
                onTap: () {
                  controller.clearSearch();
                },
                child: Icon(
                  Icons.clear,
                  color: AppColors.white500,
                  size: 18.sp,
                ),
              );
            }
            return SizedBox.shrink();
          }),
        ],
      ),
    );
  }

  Widget _buildJournalEntryCard({
    required String title,
    required String mood,
    required String content,
    required String timestamp,
    required bool hasImage,
    required int index,
    required bool isOlder,
    required BuildContext context,
  }) {

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: hasImage
            ? DecorationImage(
                image: AssetImage(CustomAssets.journal_background_with_image),
                fit: BoxFit.cover,
              )
            : DecorationImage(
                image: AssetImage(CustomAssets.journal_background_without_image),
                fit: BoxFit.cover,
              ),
      ),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withValues(alpha: 0.5),
              Colors.black.withValues(alpha: 0.8),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: AppFonts.urbanistBold(
                        fontSize: 14.sp,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      mood,
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ],
                ),
                PopupMenuButton<String>(
                  icon: Icon(
                    Icons.more_vert,
                    color: AppColors.whiteColor,
                    size: 20.sp,
                  ),
                  color: AppColors.blackLightColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  onSelected: (value) {
                    if (value == 'edit') {
                      // Handle edit journal - Navigate to add_journal with data
                      context.push(
                        AppPath.addJournal,
                        extra: {
                          'mood': mood,
                          'title': title,
                          'content': content,
                          'hasImage': hasImage,
                          'isEditing': true,
                        },
                      );
                    } else if (value == 'delete') {
                      // Handle delete journal - Recent Entry
                      _showDeleteDialog(title, index, false);
                    }
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'edit',
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit,
                            color: AppColors.whiteColor,
                            size: 18.sp,
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            'Edit Journal',
                            style: AppFonts.urbanistMedium(
                              fontSize: 14.sp,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 18.sp,
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            'Delete Journal',
                            style: AppFonts.urbanistMedium(
                              fontSize: 14.sp,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            if (hasImage) ...[
              SizedBox(height: 12.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  CustomAssets.journal_image,
                  width: double.infinity,
                  height: 140.h,
                  fit: BoxFit.cover,
                ),
              ),
            ],

            SizedBox(height: 12.h),

            Text(
              content,
              style: AppFonts.urbanistRegular(
                fontSize: 12.sp,
                color: AppColors.white500,
                height: 1.4,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),

            SizedBox(height: 12.h),

            Align(
              alignment: Alignment.centerRight,
              child: Text(
                timestamp,
                style: AppFonts.urbanistMedium(
                  fontSize: 10.sp,
                  color: AppColors.white500.withValues(alpha: 0.7),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOlderJournalEntryCard({
    required String title,
    required String mood,
    required String content,
    required String timestamp,
    required bool hasImage,
    required int index,
    required bool isOlder,
    required BuildContext context,
  }) {

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(
          image: AssetImage(CustomAssets.older_journal_background_without_image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withValues(alpha: 0.5),
              Colors.black.withValues(alpha: 0.8),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: AppFonts.urbanistBold(
                        fontSize: 14.sp,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      mood,
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ],
                ),
                PopupMenuButton<String>(
                  icon: Icon(
                    Icons.more_vert,
                    color: AppColors.whiteColor,
                    size: 20.sp,
                  ),
                  color: AppColors.blackLightColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  onSelected: (value) {
                    if (value == 'edit') {
                      // Handle edit journal - Navigate to add_journal with data
                      context.push(
                        AppPath.addJournal,
                        extra: {
                          'mood': mood,
                          'title': title,
                          'content': content,
                          'hasImage': hasImage,
                          'isEditing': true,
                        },
                      );
                    } else if (value == 'delete') {
                      // Handle delete journal - Older Entry
                      _showDeleteDialog(title, index, true);
                    }
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'edit',
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit,
                            color: AppColors.whiteColor,
                            size: 18.sp,
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            'Edit Journal',
                            style: AppFonts.urbanistMedium(
                              fontSize: 14.sp,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 18.sp,
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            'Delete Journal',
                            style: AppFonts.urbanistMedium(
                              fontSize: 14.sp,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            if (hasImage) ...[
              SizedBox(height: 12.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  CustomAssets.older_journal_image,
                  width: double.infinity,
                  height: 140.h,
                  fit: BoxFit.cover,
                ),
              ),
            ],

            SizedBox(height: 12.h),

            Text(
              content,
              style: AppFonts.urbanistRegular(
                fontSize: 12.sp,
                color: AppColors.white500,
                height: 1.4,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),

            SizedBox(height: 12.h),

            Align(
              alignment: Alignment.centerRight,
              child: Text(
                timestamp,
                style: AppFonts.urbanistMedium(
                  fontSize: 10.sp,
                  color: AppColors.white500.withValues(alpha: 0.7),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(String title, int index, bool isOlder) {
    final controller = Get.find<ViewJournalController>();

    Get.dialog(
      AlertDialog(
        backgroundColor: AppColors.blackLightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(
          'Delete Journal',
          style: AppFonts.urbanistBold(
            fontSize: 18.sp,
            color: AppColors.whiteColor,
          ),
        ),
        content: Text(
          'Are you sure you want to delete "$title"? This action cannot be undone.',
          style: AppFonts.urbanistMedium(
            fontSize: 14.sp,
            color: AppColors.white500,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              'Cancel',
              style: AppFonts.urbanistSemiBold(
                fontSize: 14.sp,
                color: AppColors.white500,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
              // Delete based on whether it's older or recent entry
              if (isOlder) {
                controller.deleteOlderJournalEntry(index);
              } else {
                controller.deleteJournalEntry(index);
              }
              Get.snackbar(
                'Deleted',
                'Journal entry has been deleted successfully',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.red,
                colorText: AppColors.whiteColor,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text(
              'Delete',
              style: AppFonts.urbanistBold(
                fontSize: 14.sp,
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

