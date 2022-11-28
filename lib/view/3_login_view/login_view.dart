import 'package:fitness_app/core/constants/color_const/color_const.dart';
import 'package:fitness_app/core/extension/size_extension/size_extension.dart';
import 'package:fitness_app/view/3_login_view/_widget/sign_up_view.dart';
import 'package:fitness_app/view/3_login_view/_widget/sing_in_view.dart';
import 'package:fitness_app/view/3_login_view/_widget/tab_bar_widget.dart';
import 'package:fitness_app/view/3_login_view/cubit/login_cubit.dart';
import 'package:fitness_app/view/3_login_view/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          return GestureDetector(
             onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
            child: _loginScaffold(context));
        },
      ),
    );
  }

  Scaffold _loginScaffold(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: context.h * 0.65,
                    width: context.w,
                    child: Image.asset(context.watch<LoginCubit>().tabBarCurrent != 0?"assets/images/Rectangle 6.png":"assets/images/singup.png",
                        fit: BoxFit.cover),
                  ),
                  Container(
                    height: context.h * 0.65,
                    width: context.w,
                    padding:
                        EdgeInsets.only(top: 250.h, left: 30.w, right: 30.w),
                    color: ColorConst.instance.scaffoldBackgroundColor
                        .withOpacity(0.6),
                    child: Text(
                      context.watch<LoginCubit>().tabBarCurrent != 0?"Dasturga Xush Kelibsiz".toUpperCase():"Dasturga Xush Kelibsiz".toUpperCase(),
                      style: TextStyle(
                        color: ColorConst.instance.white,
                        fontSize: 35.h,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.h * 0.3),
            ],
          ),
          Positioned(
            child: SizedBox(
              height: context.h,
              width: context.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 45.h),
                  TabBarWidget(contextt: context),
                  const Spacer(),
                  context.watch<LoginCubit>().tabBarCurrent != 0?const SignInView():const SignUp()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
