import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/core/constants/enums/locale_kays_enum.dart';
import 'package:fitness_app/core/constants/navigation_const/navigation_const.dart';
import 'package:fitness_app/core/init/cache/cache_manager.dart';
import 'package:fitness_app/core/init/cache/cashe_date.dart';
import 'package:fitness_app/core/init/lang/locale_manager.dart';
import 'package:fitness_app/core/init/theme/theme_data.dart';
import 'package:fitness_app/routes/route.dart';
import 'package:fitness_app/view/3_login_view/cubit/login_cubit.dart';
import 'package:fitness_app/view/5_home_view/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  SharedPreferences pref = await SharedPreferences.getInstance();

  await GetStorage.init();
  if (GetStorage().read(PreferenceKeys.ISTRUE.toString()) != "true") {
    CashedData.init();
  }

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => LoginCubit(),
      ),
      BlocProvider(
        create: (context) => HomeCubit(),
      )
    ],
    child: EasyLocalization(
      path: "assets/langs",
      supportedLocales: LangManager.instance.supportLocale,
      startLocale: LangManager.instance.uzLocale,
      fallbackLocale: LangManager.instance.uzLocale,
      child: MyApp( email: pref.getString('email')),
    ),
  ));
}

class MyApp extends StatelessWidget {
 late String? email;
  MyApp({Key? key,required this.email}) : super(key: key);

  final _forRoute = MyRoutes.instance;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeDataL.myTheme,
          initialRoute: NavigationConst.INSIGHT,
          onGenerateRoute: _forRoute.ongenerateRoute,
        );
      },
    );
  }
}
