import 'package:circle_flags/circle_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/constants/color_const/color_const.dart';
import 'package:fitness_app/core/constants/navigation_const/navigation_const.dart';
import 'package:fitness_app/core/extension/text_lang_extension/lang_extension.dart';
import 'package:fitness_app/core/init/lang/locale_keys.g.dart';
import 'package:fitness_app/core/init/lang/locale_manager.dart';
import 'package:fitness_app/view/5_home_view/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChangaLangView extends StatelessWidget {
  const ChangaLangView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.instance.scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.all(8.0.w),
          child: GestureDetector(
            child: SvgPicture.asset(
              "assets/icons/Circle Left.svg",
            ),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, NavigationConst.HOME, (route) => false);
            },
          ),
        ),
        title: Text(
          LocaleKeys.til_ozgartirish.t.toUpperCase(),
          style: TextStyle(
            color: ColorConst.instance.white,
            fontSize: 25.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Divider(
              color: ColorConst.instance.grey,
            ),
            ListTile(
              leading: CircleFlag("uz", size: 35.h),
              title: Text(
                "O'zbek tili",
                style: TextStyle(
                  color: ColorConst.instance.white,
                  fontSize: 20.h,
                ),
              ),
              onTap: (){
               context.setLocale(LangManager.instance.uzLocale);
               context.read<HomeCubit>().changeLang(0);
              },
            ),
            Divider(
              color: ColorConst.instance.grey,
            ),
            ListTile(
              leading: CircleFlag("ru", size: 35.h),
              title: Text(
                "Pусский язык",
                style: TextStyle(
                  color: ColorConst.instance.white,
                  fontSize: 20.h,
                ),
              ),
              onTap: (){

               context.setLocale(LangManager.instance.ruLocale);
               context.read<HomeCubit>().changeLang(1);
              },
            ),
            Divider(
              color: ColorConst.instance.grey,
            ),
          ],
        ),
      ),
    );
  }
}
