import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/constants/navigation_const/navigation_const.dart';
import 'package:fitness_app/core/init/lang/locale_manager.dart';
import 'package:fitness_app/core/init/theme/theme_data.dart';
import 'package:fitness_app/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    EasyLocalization(
      supportedLocales: LangManager.instance.supportLocale,
      startLocale: LangManager.instance.ruLocale,
      fallbackLocale: LangManager.instance.ruLocale,
      path: "assets/lang",
      child:  MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _forRoute = MyRoutes.instance;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeDataL.myTheme,
          initialRoute: NavigationConst.ON_BORDING,
          onGenerateRoute: _forRoute.ongenerateRoute,
        );
      },
    );
  }
}
