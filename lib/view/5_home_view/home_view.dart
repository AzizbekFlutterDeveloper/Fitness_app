import 'package:fitness_app/core/constants/color_const/color_const.dart';
import 'package:fitness_app/core/constants/navigation_const/navigation_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 60.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Salom, Azizbek",
                style: TextStyle(
                  color: ColorConst.instance.white,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                "Hayrli kun !",
                style: TextStyle(
                  color: ColorConst.instance.white,
                  fontSize: 18.sp,
                ),
              ),
              for (var i = 0; i < 3; i++)
                Column(
                  children: [
                    SizedBox(height: 32.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Qollar uchun",
                          style: TextStyle(
                            color: ColorConst.instance.white,
                            fontSize: 22.sp,
                          ),
                        ),
                        Text(
                          "Hammasi",
                          style: TextStyle(
                            color: ColorConst.instance.kPrimaryColor,
                            fontSize: 18.sp,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      child: Container(
                        height: 160.h,
                        width: 327.w,
                        margin: EdgeInsets.only(top: 15.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: ColorConst.instance.kPrimaryColor,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/Image.png"),
                          ),
                        ),
                        child: Container(
                          height: 160.h,
                          width: 327.w,
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: ColorConst.instance.scaffoldBackgroundColor
                                .withOpacity(0.6),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Jami: 15 ta mashq",
                                style: TextStyle(
                                  color: ColorConst.instance.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "Davomiyligi: 7,5 daqiqa",
                                style: TextStyle(
                                  color: ColorConst.instance.kPrimaryColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, NavigationConst.EXERCISE);
                      },
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
