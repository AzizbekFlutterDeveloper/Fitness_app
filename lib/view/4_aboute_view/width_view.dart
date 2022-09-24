import 'package:fitness_app/core/constants/color_const/color_const.dart';
import 'package:fitness_app/core/constants/navigation_const/navigation_const.dart';
import 'package:fitness_app/view/4_aboute_view/cubit/aboute_cubit.dart';
import 'package:fitness_app/view/4_aboute_view/cubit/aboute_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wheel_slider/wheel_slider.dart';

class WidthView extends StatelessWidget {
  const WidthView({Key? key}) : super(key: key);

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
              "Sizning vazningiz qancha?".toUpperCase(),
              style: TextStyle(
                color: ColorConst.instance.white,
                fontSize: 30.sp,
                
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.h),
            Text(
              "Buni keyinroq oʻzgartirishingiz mumkin".toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorConst.instance.white,
                fontSize: 15.sp,
              ),
            ),
            Spacer(),
            Text("${context.watch<AbouteCubit>().kg} kg", style: TextStyle(color: ColorConst.instance.white, fontSize: 40.sp)),
             SizedBox(height: 15.h),
            WheelSlider(
              totalCount: 500,
              initValue: 1,
              lineColor: ColorConst.instance.kPrimaryColor,
              pointerColor: ColorConst.instance.white,
              onValueChanged: (val) {
                context.read<AbouteCubit>().chanegeKg(val);
              },
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
                    Navigator.pushNamed(context, NavigationConst.HEIGHT);
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
