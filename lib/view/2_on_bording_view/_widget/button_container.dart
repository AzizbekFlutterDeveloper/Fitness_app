import 'package:fitness_app/core/constants/color_const/color_const.dart';
import 'package:fitness_app/core/constants/navigation_const/navigation_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonContainerOnBording extends StatelessWidget {
  const ButtonContainerOnBording({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 50.h,
        width: 185.w,
        margin: EdgeInsets.only(top: 75.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(48.r),
            color: ColorConst.instance.kPrimaryColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Boshlash",
              style: TextStyle(
                color: Colors.black,
                fontSize: 17.h,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 15.w),
            const Icon(
              Icons.play_arrow,
              color: Colors.black,
            ),
          ],
        ),
      ),
      onTap: (){
        Navigator.pushNamedAndRemoveUntil(context, NavigationConst.LOGIN_VIEW, (route) => false);
      },
    );
  }
}
