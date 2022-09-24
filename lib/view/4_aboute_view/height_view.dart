import 'package:fitness_app/core/constants/color_const/color_const.dart';
import 'package:fitness_app/core/constants/navigation_const/navigation_const.dart';
import 'package:fitness_app/view/4_aboute_view/cubit/aboute_cubit.dart';
import 'package:fitness_app/view/4_aboute_view/cubit/aboute_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wheel_slider/wheel_slider.dart';

class HeightView extends StatelessWidget {
  const HeightView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AbouteCubit(),
      child: BlocConsumer<AbouteCubit, AbouteState>(
        listener: (context, state) {},
        builder: (context, state) {
          return _ageScaffold(context);
        },
      ),
    );
  }

  Scaffold _ageScaffold(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 44.h, horizontal: 34.w),
        child: Column(
          children: [
            SizedBox(height: 36.h),
            Text(
              "Sizning bo'yingiz qancha?".toUpperCase(),
              style: TextStyle(
                color: ColorConst.instance.white,
                fontSize: 30.sp,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.h),
            Text(
              "Bu sizning shaxsiy rejangizni yaratishga yordam beradi".toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorConst.instance.white,
                fontSize: 15.sp,
              ),
            ),
            SizedBox(height: 108.h),
            Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                WheelSlider.number(
                  horizontal: false,
                  perspective: 0.01,
                  totalCount: 300,
                  itemSize: 70.sp,
                  listWidth: 130.w,
                  verticalListWidth: 130.w,
                  initValue: 1,
                  selectedNumberStyle: TextStyle(
                      color: ColorConst.instance.kPrimaryColor,
                      fontSize: 50.sp),
                  pointerColor: ColorConst.instance.kPrimaryColor,
                  unSelectedNumberStyle: TextStyle(
                    fontSize: 40.sp,
                    color: ColorConst.instance.kPrimaryColor.withOpacity(0.5),
                  ),
                  currentIndex: context.watch<AbouteCubit>().age,
                  onValueChanged: (val) {
                    context.read<AbouteCubit>().chanegeAge(val);
                  },
                ),
                Positioned(
                    child: Text(
                  "sm",
                  style: TextStyle(
                    color: ColorConst.instance.white,
                    fontSize: 20.sp,
                  ),
                ))
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
                        "Keyingisi",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, NavigationConst.JOB);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
