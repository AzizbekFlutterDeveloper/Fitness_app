import 'package:fitness_app/core/constants/navigation_const/navigation_const.dart';
import 'package:fitness_app/core/extension/size_extension/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4)).then((value) {
      Navigator.pushNamedAndRemoveUntil(context, NavigationConst.ON_BORDING, (route) => false);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 290.h, width: context.w),
          SizedBox(
            height: 116.h,
            width: 117.w,
            child: Image.asset("assets/images/Mask group.png"),
          ),
          SizedBox(height: 40.h),
          SizedBox(
            height: 122.h,
            width: 293.w,
            child: Image.asset("assets/images/Dev Muscles.png"),
          ),
        ],
      ),
    );
  }
}
