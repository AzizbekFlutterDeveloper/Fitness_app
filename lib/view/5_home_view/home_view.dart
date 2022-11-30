import 'package:fitness_app/core/constants/color_const/color_const.dart';
import 'package:fitness_app/core/constants/enums/locale_kays_enum.dart';
import 'package:fitness_app/core/constants/navigation_const/navigation_const.dart';
import 'package:fitness_app/core/data/mashq_data/mashq_data.dart';
import 'package:fitness_app/core/extension/text_lang_extension/lang_extension.dart';
import 'package:fitness_app/core/init/cache/cache_manager.dart';
import 'package:fitness_app/core/init/lang/locale_keys.g.dart';
import 'package:fitness_app/model/mashq_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 60.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                GetStorage().read(PreferenceKeys.NAME.toString()),
                style: TextStyle(
                  color: ColorConst.instance.white,
                  fontSize: 32.h,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                LocaleKeys.hayli_kum.t,
                style: TextStyle(
                  color: ColorConst.instance.white,
                  fontSize: 18.h,
                ),
              ),
              for (var i = 0; i < MashqData.homeData.length; i++)
                Column(
                  children: [
                    SizedBox(height: 32.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          MashqData.homeData[i]['name'][GetStorage()
                              .read(PreferenceKeys.TOKEN.toString())],
                          style: TextStyle(
                            color: ColorConst.instance.white,
                            fontSize: 22.h,
                          ),
                        ),
                        GestureDetector(
                          child: Text(
                            LocaleKeys.hammasi.t,
                            style: TextStyle(
                              color: ColorConst.instance.kPrimaryColor,
                              fontSize: 18.h,
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              NavigationConst.EXERCISE,
                              arguments: HomeModel(
                                list: MashqData.mashqData[i],
                                index: i,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    GestureDetector(
                      child: Container(
                        height: 160.h,
                        width: 327.w,
                        margin: EdgeInsets.only(top: 15.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: ColorConst.instance.kPrimaryColor,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(MashqData.homeData[i]['img']),
                          ),
                        ),
                        child: Container(
                          height: 160.h,
                          width: 327.w,
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: ColorConst.instance.scaffoldBackgroundColor
                                .withOpacity(0.6),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "${LocaleKeys.jami.t}: ${MashqData.homeData[i]['soni']} ${LocaleKeys.ta_mashq.t}",
                                style: TextStyle(
                                  color: ColorConst.instance.white,
                                  fontSize: 20.h,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "${LocaleKeys.davomiyligi.t}: ${MashqData.homeData[i]['min']} ${LocaleKeys.min.t}",
                                style: TextStyle(
                                  color: ColorConst.instance.kPrimaryColor,
                                  fontSize: 18.h,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          NavigationConst.EXERCISE,
                          arguments: HomeModel(
                            list: MashqData.mashqData[i],
                            index: i,
                          ),
                        );
                      },
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
