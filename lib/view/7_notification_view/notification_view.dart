import 'package:fitness_app/core/constants/color_const/color_const.dart';
import 'package:fitness_app/core/extension/text_lang_extension/lang_extension.dart';
import 'package:fitness_app/core/init/lang/locale_keys.g.dart';
import 'package:fitness_app/view/5_home_view/cubit/home_cubit.dart';
import 'package:fitness_app/view/5_home_view/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

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
              LocaleKeys.habarnomalar.t.toUpperCase(),
              style: TextStyle(
                color: ColorConst.instance.white,
                fontSize: 32.h,
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
                            i==0?LocaleKeys.yangi.t:i==1?LocaleKeys.hozirgi.t:LocaleKeys.oldingi.t,
                            style: TextStyle(
                              color:
                                  ColorConst.instance.scaffoldBackgroundColor,
                              fontSize: 17.h,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                       
                        context.read<HomeCubit>().changeTabBarIndex(i);
                      },
                    ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            Expanded(child: Center(
              child: Lottie.asset("assets/icons/77008-not-found.json"),
            ),),
            // for (var i = 0; i < 3; i++)
            //   ListTile(
            //     contentPadding: EdgeInsets.zero,
            //     leading: CircleAvatar(
            //       backgroundImage: AssetImage("assets/images/onbording.jpg"),
            //     ),
            //     title: Text(
            //       "Xabarnoma sarlavhasi",
            //       style: TextStyle(
            //         color: ColorConst.instance.white,
            //         fontWeight: FontWeight.w500,
            //         fontSize: 18.h,
            //       ),
            //     ),
            //     subtitle: Text(
            //       "Xabarnoma matni",
            //       style: TextStyle(
            //         color: ColorConst.instance.white,
            //         fontWeight: FontWeight.w400,
            //         fontSize: 16.h,
            //       ),
            //     ),
            //     trailing: Text(
            //       "9:45 AM",
            //       style: TextStyle(
            //         color: ColorConst.instance.white,
            //         fontWeight: FontWeight.w400,
            //         fontSize: 17.h,
            //       ),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
