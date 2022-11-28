import 'package:fitness_app/core/constants/color_const/color_const.dart';
import 'package:fitness_app/core/constants/enums/locale_kays_enum.dart';
import 'package:fitness_app/core/constants/navigation_const/navigation_const.dart';
import 'package:fitness_app/core/extension/size_extension/size_extension.dart';
import 'package:fitness_app/service/firebase_auth/firebase_auth_service.dart';
import 'package:fitness_app/view/3_login_view/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 6,
      child: ClipPath(
        clipper: DiagonalPathClipperTwo(),
        child: Container(
          height: context.h * 0.5,
          width: context.w,
          decoration: BoxDecoration(
            color: ColorConst.instance.scaffoldBackgroundColor,
          ),
          child: RotatedBox(
            quarterTurns: 6,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 48.h, horizontal: 32.h),
              child: Form(
                key: context.watch<LoginCubit>().formKey,
                child: Column(
                  children: [
                    SizedBox(height: 40.h),
                    TextFormField(
                      style: TextStyle(color: Colors.white, fontSize: 18.h),
                      decoration: InputDecoration(
                        hintText: "Email",
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18.h,
                        ),
                        errorStyle:
                            TextStyle(color: Colors.red, fontSize: 14.h),
                      ),
                      validator: (value) {
                        if ("test@gmail.com" != value) {
                          return "Bunday email royhatdan o'tmagan !";
                        }
                      },
                    ),
                    SizedBox(height: 30.h),
                    TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.h,
                      ),
                      decoration: InputDecoration(
                        hintText: "Parol",
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18.h,
                        ),
                        errorStyle:
                            TextStyle(color: Colors.red, fontSize: 14.h),
                      ),
                      validator: (value) {
                        if ("qazxswedc" != value) {
                          return "Parolingiz xato kiritildi !";
                        }
                      },
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        SizedBox(width: 20.w),
                        GestureDetector(
                          onTap: (() {
                            context.read<LoginCubit>().signInGoogle(context);
                            // FirebaseAuthServise().signInWithGoogle(context);
                          }),
                          child: CircleAvatar(
                            backgroundColor: ColorConst.instance.grey,
                            radius: 27.r,
                            child: SvgPicture.asset("assets/icons/Google.svg"),
                          ),
                        ),
                        const Spacer(),
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
                                "Kirish",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.h,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            context.read<LoginCubit>().signInEmail(context);

                            // FirebaseAuthServise().createUser(context,
                            //     'nfasjaldd@gmail.com', '12345qwert', 'name');

                            //  if(BlocProvider.of<LoginCubit>(context).formKey.currentState!.validate()){
                            //   Navigator.pushNamed(
                            //     context, NavigationConst.GENDER);
                            // }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
