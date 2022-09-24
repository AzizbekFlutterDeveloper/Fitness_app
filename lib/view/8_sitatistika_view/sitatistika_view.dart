import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/constants/color_const/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SitatistikaView extends StatelessWidget {
  const SitatistikaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 24.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.r)),
              color: ColorConst.instance.grey
            ),
            height: 203.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
             
              ],
            ),
          ),
        ],
      ),
    );
  }
}
