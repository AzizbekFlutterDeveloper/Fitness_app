import 'package:fitness_app/core/constants/color_const/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ExerciseView extends StatelessWidget {
  const ExerciseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 338.h,
            flexibleSpace: Container(
              height: 390.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/Image.png"))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 32.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(40.r)),
                      color: ColorConst.instance.scaffoldBackgroundColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 135.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Qo'llar uchun mashq",
                    style: TextStyle(
                      color: ColorConst.instance.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    "Oson mashq turi",
                    style: TextStyle(
                      color: ColorConst.instance.kPrimaryColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Row(
                    children: [
                      for (var i = 0; i < 2; i++)
                        Container(
                          height: 30.h,
                          width: 86.w,
                          margin: EdgeInsets.only(right: 20.w),
                          padding: EdgeInsets.all(6.5.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: ColorConst.instance.grey),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset("assets/icons/Play.svg"),
                              Text(
                                "7,5 min",
                                style: TextStyle(
                                    color: ColorConst.instance.white,
                                    fontSize: 16.sp),
                              )
                            ],
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 20.h),
              child: Text(
                "Want your body to be healthy. Join our program with directions according to body’s goals. Increasing physical strength is the goal of strenght training. Maintain body fitness by doing physical exercise at least 2-3 times a week. ",
                style: TextStyle(
                    color: ColorConst.instance.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return GestureDetector(
                  child: Container(
                    height: 76.h,
                    width: 327.w,
                    margin:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 7.5.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: ColorConst.instance.grey,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 76.h,
                          width: 82.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.horizontal(left: Radius.circular(16.r)),
                            color: ColorConst.instance.kPrimaryColor,
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/gif/test.gif"),
                            ),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        SizedBox(
                          width: 200.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Simple Warm-Up Exercises",style: TextStyle(color: ColorConst.instance.white, fontSize: 22.sp),overflow: TextOverflow.clip,maxLines: 2,),
                              Text("00:30",style: TextStyle(color: ColorConst.instance.kPrimaryColor, fontSize: 18.sp),overflow: TextOverflow.clip,maxLines: 2,)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: (){
                    showDialog(context: context, builder: (context) => AlertDialog(
                      backgroundColor: Colors.transparent,
                      content: Column(
                        children: [
                          
                          Container(
                            height: 400.h,
                            width: 300.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              image: const DecorationImage(fit: BoxFit.cover,image: AssetImage("assets/gif/tests.gif")),
                            ),
                          ),
                        ],
                      ),
                    ),);
                  },
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
