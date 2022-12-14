
import 'dart:io';

import 'package:fitness_app/core/constants/color_const/color_const.dart';
import 'package:fitness_app/core/constants/enums/locale_kays_enum.dart';
import 'package:fitness_app/view/5_home_view/cubit/home_cubit.dart';
import 'package:fitness_app/view/5_home_view/cubit/home_state.dart';
import 'package:fitness_app/view/5_home_view/home_view.dart';
import 'package:fitness_app/view/7_notification_view/notification_view.dart';
import 'package:fitness_app/view/8_sitatistika_view/sitatistika_view.dart';
import 'package:fitness_app/view/9_profile_view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';

class BottomNavBar extends StatelessWidget {
   BottomNavBar({Key? key}) : super(key: key);
  final List<Widget> pages = [
      HomeView(),
       HealthApp(),
      const NotificationView(),
       ProfileView(),
    ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: SafeArea(
        child: BlocProvider(
          create: (context) => HomeCubit(),
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              return _scaffold(context);
            },
          ),
        ),
      ),
    );
  }

  Scaffold _scaffold(BuildContext context) {
    int bottomCurrentIndex = context.watch<HomeCubit>().bottomCurrentIndex;
    
    return Scaffold(
      body:IndexedStack(
        index: bottomCurrentIndex,
        children: pages,
      ),
       
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorConst.instance.scaffoldBackgroundColor,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: bottomCurrentIndex,
        onTap: context.read<HomeCubit>().changeBottomIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Home.svg",
              height: 24.h,
              color: bottomCurrentIndex == 0
                  ? ColorConst.instance.white
                  : ColorConst.instance.white.withOpacity(0.5),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Insight.svg",
              height: 24.h,
              color: bottomCurrentIndex == 1
                  ? ColorConst.instance.white
                  : ColorConst.instance.white.withOpacity(0.5),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Notification.svg",
              height: 24.h,
              color: bottomCurrentIndex == 2
                  ? ColorConst.instance.white
                  : ColorConst.instance.white.withOpacity(0.5),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: GetStorage().read(PreferenceKeys.IMAGE.toString()) == ""? CircleAvatar(
              radius: 16.r,
              backgroundImage: const AssetImage("assets/images/person.jpg"),
            ):CircleAvatar(
              radius: 16.r,
              backgroundImage: FileImage(File(GetStorage().read(PreferenceKeys.IMAGE.toString()))),
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
