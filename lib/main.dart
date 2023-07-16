import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:machine_test/routes/pages.dart';
import 'package:machine_test/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'NotoSansJP',
            scaffoldBackgroundColor: AppColors.kBackgroundColor,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.kPrimaryColor,
              primary: AppColors.kPrimaryColor,
              secondary: AppColors.kPrimaryColor,
            ),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: AppColors.kPrimaryColor,
              selectionHandleColor: AppColors.kPrimaryColor,
              selectionColor: AppColors.kPrimaryColor.withOpacity(0.25),
            ),
          ),
          defaultTransition: Transition.cupertino,
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
        );
      },
    );
  }
}
