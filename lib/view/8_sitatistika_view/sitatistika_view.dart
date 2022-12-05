import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/core/constants/api_consts/api_consts.dart';
import 'package:fitness_app/core/constants/color_const/color_const.dart';
import 'package:fitness_app/core/constants/navigation_const/navigation_const.dart';
import 'package:fitness_app/core/extension/text_lang_extension/lang_extension.dart';
import 'package:fitness_app/core/init/lang/locale_keys.g.dart';
import 'package:fitness_app/routes/routes/router.dart';
import 'package:fitness_app/service/exercisea_service/set_user_info.dart';
import 'package:fitness_app/view/8_sitatistika_view/_widget/animation.dart';
import 'package:fitness_app/view/8_sitatistika_view/cubit/statistic_cubit.dart';
import 'package:fitness_app/view/8_sitatistika_view/cubit/statistics_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as debugger;

import 'package:flutter_screenutil/flutter_screenutil.dart';

class HealthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 100.h,
        title: Text(
          LocaleKeys.music.t,
          style: TextStyle(
            color: ColorConst.instance.white,
            fontSize: 32.h,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder(
        future: FirebaseServise().getMusics(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          var error = 'containerdagi malumotlar ${snapshot.data.toString()}';

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
            print(documentData);
            return BlocProvider(
              create: (context) {
                var cubit = StatisticsCubit();
                cubit.addListFalse(documentData.length);
                return cubit;
              },
              child: BlocConsumer<StatisticsCubit, StatisticsState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: documentData.length,
                    itemBuilder: (context, index) {
                      return _musicContainer(
                          documentData[index], context, index);
                    },
                  );
                },
              ),
            );
            ;
          }
        },
      ),
    );
  }

  Widget _musicContainer(
      Map<String, dynamic> data, BuildContext contextt, int index) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          GestureDetector(
            child: Container(
              height: 110.h,
              width: 327.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: ColorConst.instance.grey,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    color: Colors.black,
                    blurRadius: 20.r,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Text(
                    data['musicName'] ?? "No Name",
                    style: TextStyle(
                      color: ColorConst.instance.kPrimaryColor,
                      fontSize: 23.sp,
                    ),
                  ),
                  Text(
                    data['artistName'] ?? "No Auther",
                    style: TextStyle(
                      color: ColorConst.instance.kPrimaryColor,
                      fontSize: 20.sp,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.pushNamed(contextt, NavigationConst.MUSIC,
                  arguments: data);
            },
          ),
          Positioned(
            left: 20.w,
            child: DiskAnimation(
              radius: 35.r,
              image: CachedNetworkImageProvider(
                  '${ApiConst.BASE_URL}${data['img']!}'),
              isAnimation:
                  contextt.watch<StatisticsCubit>().isDownloading[index],
            ),
          ),
        ],
      ),
    );
  }
}
