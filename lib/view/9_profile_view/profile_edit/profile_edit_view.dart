import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:fitness_app/core/constants/color_const/color_const.dart';
import 'package:fitness_app/core/constants/navigation_const/navigation_const.dart';
import 'package:fitness_app/core/extension/text_lang_extension/lang_extension.dart';
import 'package:fitness_app/core/init/lang/locale_keys.g.dart';
import 'package:fitness_app/view/3_login_view/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileEtit extends StatelessWidget {
  const ProfileEtit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          LocaleKeys.profile_tahrirlash.t.toUpperCase(),
          style: TextStyle(
            color: ColorConst.instance.white,
            fontSize: 25.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Form(
          key: context.watch<LoginCubit>().formKey,
          child: Column(
            children: [
              SizedBox(
                height: 41.h,
                width: double.infinity,
              ),
              GestureDetector(
                child: Badge(
                  badgeColor: ColorConst.instance.grey,
                  padding: EdgeInsets.all(8.w),
                  alignment: AlignmentDirectional.bottomEnd,
                  position: BadgePosition.bottomEnd(),
                  badgeContent: SvgPicture.asset("assets/icons/Camera.svg"),
                  child: context.watch<LoginCubit>().imageFile.path == ""
                      ? CircleAvatar(
                          radius: 60.r,
                          backgroundColor: ColorConst.instance.grey,
                          backgroundImage:
                              AssetImage("assets/images/person.jpg"),
                        )
                      : CircleAvatar(
                          radius: 60.r,
                          backgroundColor: ColorConst.instance.grey,
                          backgroundImage:
                              FileImage(context.watch<LoginCubit>().imageFile),
                        ),
                ),
                onTap: () {
                  context.read<LoginCubit>().changeImage();
                },
              ),
              SizedBox(height: 45.h),
              TextFormField(
                style: TextStyle(color: Colors.white, fontSize: 18.h),
                controller: context.watch<LoginCubit>().nameController,
                decoration: InputDecoration(
                  hintText: LocaleKeys.ism_familya.t,
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorConst.instance.kPrimaryColor)),
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18.h,
                  ),
                  errorStyle: TextStyle(color: Colors.red, fontSize: 14.h),
                ),
                validator: (value) {
                  if (value!.length < 2) {
                    return LocaleKeys.iltimos_ismingizni_yozing.t;
                  }
                },
              ),
              SizedBox(height: 20.h),
              TextFormField(
                controller: context.watch<LoginCubit>().emailController,
                style: TextStyle(color: Colors.white, fontSize: 18.h),
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorConst.instance.kPrimaryColor)),
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18.h,
                  ),
                  errorStyle: TextStyle(color: Colors.red, fontSize: 14.h),
                ),
                validator: (value) {
                  String pattern =
                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                      r"{0,253}[a-zA-Z0-9])?)*$";
                  RegExp regex = RegExp(pattern);
                  if (value == null ||
                      value.isEmpty ||
                      !regex.hasMatch(value)) {
                    return LocaleKeys.email_manzilingiz_xato.t;
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20.h),
              Spacer(),
              GestureDetector(
                child: Container(
                  height: 48.h,
                  width: 343.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: ColorConst.instance.kPrimaryColor,
                  ),
                  child: Center(
                    child: Text(
                      LocaleKeys.saqlash.t,
                      style: TextStyle(
                          color: ColorConst.instance.scaffoldBackgroundColor,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                onTap: () {
                  if (BlocProvider.of<LoginCubit>(context, listen: false)
                      .formKey
                      .currentState!
                      .validate()) {
                        context.read<LoginCubit>().changeName().then((value) {
                           Navigator.pushNamedAndRemoveUntil(context, NavigationConst.HOME, (route) => false);
                        });
                      }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
