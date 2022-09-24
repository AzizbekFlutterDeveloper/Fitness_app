import 'package:fitness_app/core/constants/color_const/color_const.dart';
import 'package:fitness_app/view/5_home_view/cubit/home_cubit.dart';
import 'package:fitness_app/view/5_home_view/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return _scaffold(context);
        },
      ),
    );
  }

  Scaffold _scaffold(BuildContext context) {
    int tabBarCurrentIndex = context.watch<HomeCubit>().tabBarCurrentIndex;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 56.h, horizontal: 20.w),
        child: Column(
          children: [
            Text(
              "Xabarnomalar",
              style: TextStyle(
                color: ColorConst.instance.white,
                fontSize: 32.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              height: 28.h,
              width: 327.w,
              margin: EdgeInsets.symmetric(vertical: 36.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.r),
                color: Colors.grey.shade700,
              ),
              child: Row(
                children: [
                  for (var i = 0; i < 3; i++)
                    GestureDetector(
                      child: Container(
                        height: 28.h,
                        width: 108.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32.r),
                          color: i == tabBarCurrentIndex
                              ? ColorConst.instance.kPrimaryColor
                              : Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            "Oldingi",
                            style: TextStyle(
                              color:
                                  ColorConst.instance.scaffoldBackgroundColor,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        print(i);
                        context.read<HomeCubit>().changeTabBarIndex(i);
                      },
                    ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            for (var i = 0; i < 3; i++)
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/onbording.jpg"),
                ),
                title: Text(
                  "Xabarnoma sarlavhasi",
                  style: TextStyle(
                    color: ColorConst.instance.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                ),
                subtitle: Text(
                  "Xabarnoma matni",
                  style: TextStyle(
                    color: ColorConst.instance.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                  ),
                ),
                trailing: Text(
                  "9:45 AM",
                  style: TextStyle(
                    color: ColorConst.instance.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 17.sp,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
