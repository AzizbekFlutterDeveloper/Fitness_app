import 'package:dots_indicator/dots_indicator.dart';
import 'package:fitness_app/core/constants/color_const/color_const.dart';
import 'package:fitness_app/core/data/on_bording_data/list_on_bording.dart';
import 'package:fitness_app/core/extension/size_extension/size_extension.dart';
import 'package:fitness_app/view/2_on_bording_view/_widget/button_container.dart';
import 'package:fitness_app/view/2_on_bording_view/cubit/on_bording_cubit.dart';
import 'package:fitness_app/view/2_on_bording_view/cubit/on_bording_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBording extends StatelessWidget {
  const OnBording({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => OnBordingCubit(),
        child: BlocConsumer<OnBordingCubit, OnBordingState>(
          listener: (context, state) {},
          builder: (context, state) {
            return _onBordingScaffold(context);
          },
        ),
      ),
    );
  }

  Scaffold _onBordingScaffold(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: 3,
        onPageChanged: (value) {
          context.read<OnBordingCubit>().addDotsCount(value);
        },
        itemBuilder: (context, index) {
          return Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: context.h * 0.65,
                    width: context.w,
                    child: Image.asset(onbordingList[index]['img'],
                        fit: BoxFit.cover),
                  ),
                  SizedBox(height: context.h * 0.3),
                ],
              ),
              Positioned(
                child: RotatedBox(
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
                        child: Column(
                          children: [
                            SizedBox(height: context.h * 0.15),
                            Text(
                              onbordingList[index]['name'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.h,
                                fontFamily: "Open",
                              ),
                              textAlign: TextAlign.center,
                            ),
                            index == 2
                                ? const ButtonContainerOnBording()
                                : const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: DotsIndicator(
        dotsCount: 3,
        position: context.watch<OnBordingCubit>().dotsCount.toDouble(),
        decorator: DotsDecorator(
          shape: const Border(),
          activeSize: Size(36.w, 4.h),
          size: Size(16.w, 4.h),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
