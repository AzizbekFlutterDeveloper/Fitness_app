import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/core/constants/api_consts/api_consts.dart';
import 'package:fitness_app/core/constants/color_const/color_const.dart';
import 'package:fitness_app/core/constants/enums/locale_kays_enum.dart';
import 'package:fitness_app/core/data/mashq_data/mashq_data.dart';
import 'package:fitness_app/core/extension/size_extension/size_extension.dart';
import 'package:fitness_app/core/extension/text_lang_extension/lang_extension.dart';
import 'package:fitness_app/core/init/lang/locale_keys.g.dart';
import 'package:fitness_app/model/mashq_model.dart';
import 'package:fitness_app/service/exercisea_service/set_user_info.dart';
import 'package:fitness_app/view/6_exercise_view/cubit/mashq_cubit.dart';
import 'package:fitness_app/view/6_exercise_view/cubit/mashq_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'dart:developer' as debugger;

class ExerciseView extends StatelessWidget {
  final HomeModel dataList;
  const ExerciseView({Key? key, required this.dataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MashqCubit(),
      child: BlocConsumer<MashqCubit, MashqState>(
        listener: (context, state) {},
        builder: (context, state) {
          return _scaffold(context);
        },
      ),
    );
  }

  Scaffold _scaffold(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FirebaseServise().getExercises(context
            .read<MashqCubit>()
            .getCategory(MashqData.homeData[dataList.index!]['name']
                [GetStorage().read(PreferenceKeys.TOKEN.toString())])),
        builder: (context, AsyncSnapshot snapshot) {
          var error = 'containerdagi malumotlar ${snapshot.data.toString()}';
          //     List<dynamic> documentData = snapshot.data?.docs.map((e) => e.data() as Map<String, dynamic>?).toList();
          // debugger.log('${snapshot.data}');

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Not Data"),
            );
          } else {
            List<dynamic> documentData = snapshot.data?.docs
                .map((e) => e.data() as Map<String, dynamic>?)
                .toList();
            debugger.log('${documentData}');

            return Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 338.h,
                      flexibleSpace: Container(
                        height: 390.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(MashqData
                                    .homeData[dataList.index!]['img']))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 32.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(40.r)),
                                color:
                                    ColorConst.instance.scaffoldBackgroundColor,
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
                              MashqData.homeData[dataList.index!]['name'][
                                  GetStorage()
                                      .read(PreferenceKeys.TOKEN.toString())],
                              style: TextStyle(
                                color: ColorConst.instance.white,
                                fontSize: 24.h,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 15.h),
                            Text(
                              LocaleKeys.oson_mashq_turi.t,
                              style: TextStyle(
                                color: ColorConst.instance.kPrimaryColor,
                                fontSize: 20.h,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(height: 32.h),
                            Row(
                              children: [
                                for (var i = 0; i < 2; i++)
                                  Container(
                                    height: 35.h,
                                    width: 110.w,
                                    margin: EdgeInsets.only(right: 20.w),
                                    padding: EdgeInsets.all(8.w),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        color: ColorConst.instance.grey),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        i == 0
                                            ? const Icon(Icons.fitness_center)
                                            : const Icon(Icons
                                                .play_circle_filled_outlined),
                                        Text(
                                          i == 0
                                              ? "${MashqData.homeData[dataList.index!]['soni']}  ta"
                                              : "${MashqData.homeData[dataList.index!]['min']} ${LocaleKeys.min.t}",
                                          style: TextStyle(
                                            color: ColorConst.instance.white,
                                            fontSize: 16.h,
                                          ),
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
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          var name = MashqData.homeData[dataList.index!]['name']
                              [GetStorage()
                                  .read(PreferenceKeys.TOKEN.toString())];
                          QueryDocumentSnapshot data =
                              snapshot.data!.docs[index];
                          
                          return GestureDetector(
                            child: Container(
                              height: 76.h,
                              width: 327.w,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 24.w, vertical: 7.5.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: ColorConst.instance.grey,
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 76.h,
                                    width: 82.w,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(16.r)),
                                      child: FadeInImage.assetNetwork(
                                        fit: BoxFit.cover,
                                        placeholder:
                                            "assets/images/loading.gif",
                                        image:
                                            '${ApiConst.BASE_URL}${data['img']}',
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  SizedBox(
                                    width: 200.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          data[context
                                              .read<MashqCubit>()
                                              .getLang(name)],
                                          style: TextStyle(
                                              color: ColorConst.instance.white,
                                              fontSize: 22.h),
                                          overflow: TextOverflow.clip,
                                          maxLines: 2,
                                        ),
                                        Text(
                                          data['min'],
                                          style: TextStyle(
                                              color: ColorConst
                                                  .instance.kPrimaryColor,
                                              fontSize: 18.h),
                                          overflow: TextOverflow.clip,
                                          maxLines: 2,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              context.read<MashqCubit>().addVisiblitiy(
                                  true,
                                  index,
                                  '${ApiConst.BASE_URL}${data['img']}');
                            },
                          );
                        },
                        childCount: snapshot.data.docs.length,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  child: Visibility(
                    visible: context.watch<MashqCubit>().isVisiblitiy,
                    child: Container(
                      height: context.h,
                      width: context.w,
                      color: ColorConst.instance.grey.withOpacity(0.8),
                      child: SizedBox(
                        width: 300.w,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 50.h, horizontal: 30.w),
                          child: Column(
                            children: [
                              GestureDetector(
                                child: CircleAvatar(
                                  radius: 20.r,
                                  child: Icon(Icons.cancel,
                                      color: ColorConst.instance.red),
                                ),
                                onTap: () {
                                  context
                                      .read<MashqCubit>()
                                      .addVisiblitiy(false, 0, '');
                                },
                              ),
                              SizedBox(height: 40.h),
                              SizedBox(
                                height: 50.h,
                                child: SlideCountdownSeparated(
                                  height: 50.h,
                                  textStyle: TextStyle(
                                    color: ColorConst.instance.kPrimaryColor,
                                    fontSize: 30.sp,
                                  ),
                                  width: 50.h,
                                  decoration: BoxDecoration(
                                    color: ColorConst
                                        .instance.scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  duration: const Duration(seconds: 45),
                                ),
                              ),
                              SizedBox(height: 40.h),
                              Container(
                                height: 400.h,
                                width: 300.w,
                                // decoration: BoxDecoration(
                                //   borderRadius: BorderRadius.circular(16.r),
                                //   image: DecorationImage(
                                //     fit: BoxFit.cover,
                                //     image: CachedNetworkImageProvider(
                                //         context.watch<MashqCubit>().img),
                                //   ),
                                // ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16.r),
                                  child: FadeInImage.assetNetwork(
                                    fit: BoxFit.cover,
                                    placeholder: "assets/images/loading.gif",
                                    image: context.watch<MashqCubit>().img,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
