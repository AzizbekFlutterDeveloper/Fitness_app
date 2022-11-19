import 'package:fitness_app/core/constants/color_const/color_const.dart';
import 'package:fitness_app/core/constants/navigation_const/navigation_const.dart';
import 'package:fitness_app/core/extension/size_extension/size_extension.dart';
import 'package:fitness_app/view/3_login_view/cubit/login_cubit.dart';
import 'package:fitness_app/view/3_login_view/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          return _scaffold(context);
        },
      ),
    );
  }

  RotatedBox _scaffold(BuildContext context) {
    return RotatedBox(
      quarterTurns: 6,
      child: ClipPath(
        clipper: DiagonalPathClipperTwo(),
        child: Container(
          height: context.h * 0.6,
          width: context.w,
          decoration: BoxDecoration(
            color: ColorConst.instance.scaffoldBackgroundColor,
          ),
          child: RotatedBox(
            quarterTurns: 6,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 32.h),
              child: Form(
                key: context.watch<LoginCubit>().formKey,
                child: Column(
                  children: [
                    SizedBox(height: 45.h),
                    TextFormField(
                      style: TextStyle(color: Colors.white, fontSize: 18.h),
                      controller: context.watch<LoginCubit>().nameController,
                      decoration: InputDecoration(
                        hintText: "Ism-Familya",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorConst.instance.kPrimaryColor)
                        ),
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18.h,
                        ),
                        errorStyle: TextStyle(color: Colors.red, fontSize: 14.h),
                      ),
                      validator: (value) {
                        if (value!.length < 2) {
                          return "Iltimos Ismingizni yozing";
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
                          borderSide: BorderSide(color: ColorConst.instance.kPrimaryColor)
                        ),
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
                          return 'Email manzilingiz xato!';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 20.h),
                    TextFormField(
                      controller:
                          context.watch<LoginCubit>().passwordController,
                      style: TextStyle(color: Colors.white, fontSize: 18.h),
                      decoration: InputDecoration(
                        hintText: "Parol",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorConst.instance.kPrimaryColor)
                        ),
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18.h,
                        ),
                        errorStyle: TextStyle(color: Colors.red, fontSize: 14.h),
                      ),
                      
                      validator: (value) {
                        if(value!.length < 8){
                          return "Parol kamida 8 ta element bolishi kerak!";
                        }
                      },
                    ),
                    SizedBox(height: 20.h),
                    TextFormField(
                      controller:
                          context.watch<LoginCubit>().againPasswordController,
                      style: TextStyle(color: Colors.white, fontSize: 18.h),
                      decoration: InputDecoration(
                        hintText: "Parolni takrorlash",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorConst.instance.kPrimaryColor)
                        ),
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18.h,
                        ),
                        errorStyle: TextStyle(color: Colors.red, fontSize: 14.h),
                      ),
                      validator: (value) {
                        if(BlocProvider.of<LoginCubit>(context,listen: false).passwordController.text != value){
                          return "Prol tog'ri kelmadi";
                        }
                      },
                    ),
                    Spacer(),
                    Row(
                      children: [
                       
                        SizedBox(width: 20.w),
                        CircleAvatar(
                          backgroundColor: ColorConst.instance.grey,
                          radius: 27.r,
                          child: SvgPicture.asset("assets/icons/Google.svg"),
                        ),
                        Spacer(),
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
                                "Register",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.h,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            if(BlocProvider.of<LoginCubit>(context,listen: false).formKey.currentState!.validate()){
                              context.read<LoginCubit>().addName();
                              Navigator.pushNamed(
                                context, NavigationConst.GENDER);
                            }
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
