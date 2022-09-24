import 'package:fitness_app/core/constants/color_const/color_const.dart';
import 'package:fitness_app/core/constants/navigation_const/navigation_const.dart';
import 'package:fitness_app/core/extension/size_extension/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 6,
      child: ClipPath(
        clipper: DiagonalPathClipperTwo(),
        child: Container(
          height: context.h * 0.5,
          width: context.w,
          decoration: BoxDecoration(
            color: ColorConst.instance.scaffoldBackgroundColor,
          ),
          child: RotatedBox(
            quarterTurns: 6,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 48.h, horizontal: 32.h),
              child: Column(
                children: [
                  SizedBox(height: 40.h),
                  TextFormField(
                    style: TextStyle(color: Colors.white, fontSize: 24.sp),
                    decoration: InputDecoration(
                        hintText: "Email",
                        border: InputBorder.none,
                        hintStyle:
                            TextStyle(color: Colors.white, fontSize: 24.sp)),
                  ),
                  Divider(color: ColorConst.instance.kPrimaryColor),
                  SizedBox(height: 30.h),
                  TextFormField(
                    style: TextStyle(color: Colors.white, fontSize: 24.sp),
                    decoration: InputDecoration(
                        hintText: "Parol",
                        border: InputBorder.none,
                        hintStyle:
                            TextStyle(color: Colors.white, fontSize: 24.sp)),
                  ),
                  Divider(color: ColorConst.instance.kPrimaryColor),
                  const Spacer(),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: ColorConst.instance.grey,
                        radius: 27.r,
                        child: SvgPicture.asset("assets/icons/Apple.svg"),
                      ),
                      SizedBox(width: 20.w),
                      CircleAvatar(
                        backgroundColor: ColorConst.instance.grey,
                        radius: 27.r,
                        child: SvgPicture.asset("assets/icons/Google.svg"),
                      ),
                      const Spacer(),
                      GestureDetector(
                        child: Container(
                          height: 50.h,
                          width: 125.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(48.r),
                            color: ColorConst.instance.kPrimaryColor,
                          ),
                          child: Center(
                            child: Text(
                              "Kirish",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        onTap: (){
                          Navigator.pushNamed(context, NavigationConst.GENDER);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
