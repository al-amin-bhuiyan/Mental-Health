import 'package:get/get.dart';

class ViewFullPlanController extends GetxController {
  // Track completion status of each task
  RxBool readingCompleted = false.obs;
  RxBool prayerCompleted = false.obs;
  RxBool reflectionCompleted = false.obs;

  // Calculate progress percentage
  RxInt progressPercentage = 0.obs;
  RxInt completedTasks = 0.obs;

  @override
  void onInit() {
    super.onInit();
    updateProgress();
  }

  // Toggle task completion
  void toggleReading() {
    readingCompleted.value = !readingCompleted.value;
    updateProgress();
  }

  void togglePrayer() {
    prayerCompleted.value = !prayerCompleted.value;
    updateProgress();
  }

  void toggleReflection() {
    reflectionCompleted.value = !reflectionCompleted.value;
    updateProgress();
  }

  // Update overall progress
  void updateProgress() {
    completedTasks.value = 0;
    if (readingCompleted.value) completedTasks.value++;
    if (prayerCompleted.value) completedTasks.value++;
    if (reflectionCompleted.value) completedTasks.value++;

    // Calculate percentage (each task = 33.33%)
    progressPercentage.value = (completedTasks.value * 33.33).round();

    // Make sure 3 tasks = 100%
    if (completedTasks.value == 3) {
      progressPercentage.value = 100;
    }
  }

  // Check if all tasks are completed
  bool get allTasksCompleted => completedTasks.value == 3;
}

