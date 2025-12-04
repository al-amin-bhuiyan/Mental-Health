import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'core/dependency/dependency.dart';
import 'core/app_route/app_route.dart';
import 'view/widgets/device_utils/device_utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DeviceUtils.lockDevicePortrait();

  // Initialize GetX controllers
  DependencyInjection.init();

  runApp(
    DevicePreview(
      enabled: true, // <-- TURN ON DEVICE PREVIEW
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: GetMaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: _lightTheme,
        routeInformationParser: AppRoute.router.routeInformationParser,
        routerDelegate: AppRoute.router.routerDelegate,
        routeInformationProvider: AppRoute.router.routeInformationProvider,

        // REQUIRED BY DevicePreview
        builder: DevicePreview.appBuilder,
        locale: DevicePreview.locale(context),
      ),
    );
  }

  ThemeData get _lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Colors.white,
      );
}
