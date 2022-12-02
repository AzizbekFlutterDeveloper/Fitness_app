import 'package:auto_size_text/auto_size_text.dart';
import 'package:fitness_app/core/constants/color_const/color_const.dart';
import 'package:fitness_app/core/constants/enums/locale_kays_enum.dart';
import 'package:fitness_app/core/constants/navigation_const/navigation_const.dart';
import 'package:fitness_app/core/extension/size_extension/size_extension.dart';
import 'package:fitness_app/core/init/cache/cache_manager.dart';
import 'package:fitness_app/routes/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState()  {
   
    super.initState();
    Future.delayed(Duration(seconds: 4)).then((value) async{
       SharedPreferences pref = await SharedPreferences.getInstance();
      pref.getString('email') != null
          ? Navigator.pushNamedAndRemoveUntil(
              context, NavigationConst.HOME, (route) => false)
          : Navigator.pushNamedAndRemoveUntil(
              context, NavigationConst.LOGIN_VIEW, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.instance.white,
      body: Column(
        children: [
          SizedBox(height: 290.h, width: context.w),
          SizedBox(
            height: 210.h,
            width: 200.w,
            child: Image.asset("assets/images/set-sport-symbols-8368210.jpg"),
          ),
          SizedBox(height: 40.h),
          SizedBox(
            height: 122.h,
            width: 293.w,
            child: AutoSizeText(
              "Jismoniy Faolik",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 45.sp,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
