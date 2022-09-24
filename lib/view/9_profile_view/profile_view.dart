import 'package:fitness_app/core/constants/color_const/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 28.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 55.0,
                  child: CircularPercentIndicator(
                    radius: 55.0,
                    lineWidth: 3.0,
                    percent: 0.8,
                    center: CircleAvatar(
                      radius: 40.r,
                      backgroundImage:
                          const AssetImage("assets/images/person.jpg"),
                    ),
                    backgroundColor: ColorConst.instance.grey,
                    linearGradient: const LinearGradient(
                        colors: [Color(0xffD0FD3E), Color(0xffFF2424)]),
                  ),
                ),
                SizedBox(width: 65.w),
                Container(
                  height: 103.h,
                  width: 3.w,
                  color: ColorConst.instance.grey,
                ),
                SizedBox(width: 20.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kirgan",
                      style: TextStyle(
                        color: ColorConst.instance.grey,
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      "2 oy avval",
                      style: TextStyle(
                        color: ColorConst.instance.white,
                        fontSize: 18.sp,
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 86.h,
              width: 200.w,
              child: Text(
                "Azizbek Karimov",
                style: TextStyle(
                  color: ColorConst.instance.white,
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.clip,
                maxLines: 2,
              ),
            ),
            SizedBox(height: 24.h),
            for (var i = 0; i < 3; i++)
              Column(
                children: [
                  Divider(color: ColorConst.instance.grey),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "Profilr tahrirlash",
                      style: TextStyle(
                        color: ColorConst.instance.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: ColorConst.instance.white,
                      size: 18.sp,
                    ),
                  ),
                ],
              ),
            Divider(color: ColorConst.instance.grey),
            Spacer(),
            Divider(color: ColorConst.instance.grey),
            ListTile(
              title: Text(
                "Profildan chiqish",
                style: TextStyle(
                  color: ColorConst.instance.red,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Divider(color: ColorConst.instance.grey),
          ],
        ),
      ),
    );
  }
}
