import 'package:fitness_app/core/constants/color_const/color_const.dart';
import 'package:fitness_app/core/constants/navigation_const/navigation_const.dart';
import 'package:fitness_app/core/extension/text_lang_extension/lang_extension.dart';
import 'package:fitness_app/core/init/lang/locale_keys.g.dart';
import 'package:fitness_app/view/4_aboute_view/cubit/aboute_cubit.dart';
import 'package:fitness_app/view/4_aboute_view/cubit/aboute_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class GenderView extends StatelessWidget {
  const GenderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AbouteCubit(),
      child: BlocConsumer<AbouteCubit, AbouteState>(
        listener: (context, state) {},
        builder: (context, state) {
          return _genderScaffold(context);
        },
      ),
    );
  }

  Scaffold _genderScaffold(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 44.h, horizontal: 34.w),
        child: Column(
          children: [
            SizedBox(height: 36.h),
            Text(
              LocaleKeys.ozingiz_haqingizda_gapirib_bering.t.toUpperCase(),
              style: TextStyle(
                color: ColorConst.instance.white,
                fontSize: 26.h,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.h),
            Text(
              LocaleKeys.sizga_yaxshiroq_tajriba_berish_uchun_jinsizgizni_bilish_kerak.t
                  .toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorConst.instance.white,
                fontSize: 15.h,
              ),
            ),
            SizedBox(height: 60.h),
            GestureDetector(
              child: CircleAvatar(
                backgroundColor:context.watch<AbouteCubit>().gender == true?ColorConst.instance.kPrimaryColor: ColorConst.instance.grey,
                radius: 70.r,
                child: SvgPicture.asset(
                   "assets/icons/Vector (1).svg",
                  color:context.watch<AbouteCubit>().gender == true?Colors.black: ColorConst.instance.white,
                ),
              ),
              onTap: () {
                context.read<AbouteCubit>().chandeGenter(true);
              },
            ),
            SizedBox(height: 44.h),
            GestureDetector(
              child: CircleAvatar(
                backgroundColor:context.watch<AbouteCubit>().gender == false?ColorConst.instance.kPrimaryColor: ColorConst.instance.grey,
                radius: 70.r,
                child: SvgPicture.asset(
                  "assets/icons/Vector.svg",
                  color:context.watch<AbouteCubit>().gender == false?Colors.black: ColorConst.instance.white,
                ),
              ),
              onTap: () {
                context.read<AbouteCubit>().chandeGenter(false);
              },
            ),
            const Spacer(),
            context.watch<AbouteCubit>().gender == null ?SizedBox() : Row(
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
                        LocaleKeys.keyingisi.t,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.h,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    context.read<AbouteCubit>().addGenter();
                    Navigator.pushNamed(context, NavigationConst.AGE);
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
