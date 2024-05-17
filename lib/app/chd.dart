import 'package:chdtask/config/router/app_router.dart';
import 'package:chdtask/config/router/app_routes.dart';
import 'package:chdtask/config/theme/light_theme.dart';
import 'package:chdtask/core/utils/strings/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Chd extends StatelessWidget {
  const Chd({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: AppStrings.chd,
       
        debugShowCheckedModeBanner: false,
        theme: LightTheme.lightTheme,
        themeMode: ThemeMode.system,
        onGenerateRoute: AppRouter.onGenrateRoute,
        initialRoute: AppRoutes.signIn,
        locale: const Locale('en'),
      ),
    );
  }
}
