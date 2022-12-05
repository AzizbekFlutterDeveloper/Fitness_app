import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/core/constants/color_const/color_const.dart';
import 'package:fitness_app/core/constants/enums/locale_kays_enum.dart';
import 'package:fitness_app/core/constants/navigation_const/navigation_const.dart';
import 'package:fitness_app/core/extension/text_lang_extension/lang_extension.dart';
import 'package:fitness_app/core/init/lang/locale_keys.g.dart';
import 'package:fitness_app/service/exercisea_service/set_user_info.dart';
import 'package:fitness_app/view/3_login_view/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'dart:developer' as debugger;

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: FirebaseServise().fetchUserData(),
      builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        var error = 'containerdagi malumotlar ${snapshot.data.toString()}';
        debugger.log('${snapshot.data}');
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Not Data"),
          );
        } else {
          return infoPage(snapshot.data);
        }
      },
    );
  }

  Widget infoPage(data) {

  box.write(PreferenceKeys.NAME.toString(), data['name'].toString().split(' ')[0]);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 28.w),
        child: SingleChildScrollView(
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
                      center: GetStorage()
                                  .read(PreferenceKeys.IMAGE.toString()) ==
                              ""
                          ? CircleAvatar(
                              radius: 40.r,
                              backgroundImage:
                                  const AssetImage("assets/images/person.jpg"),
                            )
                          : CircleAvatar(
                              radius: 40.r,
                              backgroundImage: FileImage(File(GetStorage()
                                  .read(PreferenceKeys.IMAGE.toString()))),
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
                        LocaleKeys.kirgan.t,
                        style: TextStyle(
                          color: ColorConst.instance.grey,
                          fontSize: 14.h,
                        ),
                      ),
                      Text(
                        data == null
                            ? ' '
                            : '${data['datetime'].toString().split(" ")[0]}',
                        style: TextStyle(
                          color: ColorConst.instance.white,
                          fontSize: 18.h,
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
                  data == null ? ' ' : data['name'].toString().split(' ')[0],
                  style: TextStyle(
                    color: ColorConst.instance.white,
                    fontSize: 40.h,
                    fontWeight: FontWeight.w700,
                  ),
                  overflow: TextOverflow.clip,
                  maxLines: 2,
                ),
              ),
              SizedBox(height: 20.h),
              for (var i = 0; i < 3; i++)
                Column(
                  children: [
                    Divider(color: ColorConst.instance.grey),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        i == 0
                            ? LocaleKeys.profile_tahrirlash.t
                            : i == 1
                                ? LocaleKeys.malumotlarni_tahrirlash.t
                                : LocaleKeys.til_ozgartirish.t,
                        style: TextStyle(
                          color: ColorConst.instance.white,
                          fontSize: 18.h,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: ColorConst.instance.white,
                        size: 18.h,
                      ),
                      onTap: () {
                        if (i == 0) {
                          context.read<LoginCubit>().addController();
                          Navigator.pushNamed(
                              context, NavigationConst.PROFILE_EDIT);
                        } else if (i == 1) {
                          Navigator.pushNamed(context, NavigationConst.AGE);
                        } else {
                          Navigator.pushNamed(
                              context, NavigationConst.CHANGE_LANG);
                        }
                      },
                    ),
                  ],
                ),
              Divider(color: ColorConst.instance.grey),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "About",
                  style: TextStyle(
                    color: ColorConst.instance.white,
                    fontSize: 18.h,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: ColorConst.instance.white,
                  size: 18.h,
                ),
                onTap: () {
                  Navigator.pushNamed(context, NavigationConst.ABOUT);
                },
              ),
              Divider(color: ColorConst.instance.grey),
              Divider(color: ColorConst.instance.grey),
              ListTile(
                title: Text(
                  LocaleKeys.profiledan_chiqish.t,
                  style: TextStyle(
                    color: ColorConst.instance.red,
                    fontSize: 18.h,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  context.read<LoginCubit>().signOut(context);
                  Navigator.pushNamedAndRemoveUntil(
                      context, NavigationConst.SPLASH_VIEW, (route) => false);
                },
              ),
              Divider(color: ColorConst.instance.grey),
            ],
          ),
        ),
      ),
    );
  }
}
