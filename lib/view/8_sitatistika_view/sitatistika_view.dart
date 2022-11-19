
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fitness_app/core/constants/color_const/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class HealthApp extends StatelessWidget {
 




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: Container(
            height: 54.h,
            width: 120.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: ColorConst.instance.kPrimaryColor,
            ),
            child: Center(
              child: Text("Yuklash",style: TextStyle(color: ColorConst.instance.scaffoldBackgroundColor,fontSize: 20.sp),),
            ),
          ),
          onTap: () async{
           Future.delayed(const Duration(seconds: 3)).then((value) {
            showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.transparent,
                    content: Container(
                      height: 300.h,
                      width: 250.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: ColorConst.instance.white,
                      ),
                      child: Padding(
                        padding:  EdgeInsets.all(25.w),
                        child: Column(
                          children: [
                            Lottie.asset("assets/icons/102223-server-development.json"),
                            SizedBox(
                              height: 45.h,
                              width: 200.w,
                              child: AutoSizeText("Server bilan muamo bor!",textAlign: TextAlign.center, style: TextStyle(
                                color: ColorConst.instance.scaffoldBackgroundColor,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w500,
                              ),),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
           });
          },
        ),
      ),
    );
  }
}
  
