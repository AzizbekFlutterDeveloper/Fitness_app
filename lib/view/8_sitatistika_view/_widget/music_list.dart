import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/core/constants/api_consts/api_consts.dart';
import 'package:fitness_app/core/constants/color_const/color_const.dart';
import 'package:fitness_app/service/exercisea_service/set_user_info.dart';
import 'package:fitness_app/view/8_sitatistika_view/_widget/animation.dart';
import 'package:fitness_app/view/8_sitatistika_view/cubit/statistic_cubit.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as debugger;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MusicList extends StatelessWidget {
  BuildContext contextt;
  final data;
  MusicList({
    required this.contextt,required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return _musicContainer(data[index], contextt);
            },
          );
        }
      
    
  
}

Widget _musicContainer(Map<String, dynamic> data, BuildContext contextt) {
  return Padding(
    padding: EdgeInsets.all(16.w),
    child: Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Column(
          children: [
            contextt.watch<StatisticsCubit>().isDownloading
                ? Container(
                    height: 100.h,
                    width: 300.w,
                    padding: EdgeInsets.only(left: 80.w,right: 16.w,bottom: 10.h,top: 10.h),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16.r)),
                      color: ColorConst.instance.grey,
                    ),
                    child: contextt.read<StatisticsCubit>().addPosition(name: data['musicName'],artistname: data['artistName']),
                  )
                : const SizedBox(),
            Container(
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
                  ]),
              child: Row(
                children: [
                  SizedBox(width: 15.w),
                  SizedBox(
                    width: 300.w,
                    child: Padding(
                      padding: EdgeInsets.only(left: 100.w),
                      child: SizedBox(
                        width: 227.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.skip_previous_outlined),
                           contextt.watch<StatisticsCubit>().isDownloading
                              ?GestureDetector(
                              child: contextt.watch<StatisticsCubit>().isPlay?Icon(Icons.pause): Icon(Icons.play_arrow),
                              onTap: (){
                                contextt.read<StatisticsCubit>().audioPlay();
                              },
                            ):SizedBox(),
                            const Icon(Icons.skip_next_outlined),
                            GestureDetector(child:contextt.watch<StatisticsCubit>().isDownloading? Icon(Icons.stop): Icon(Icons.play_arrow),
                              onTap: () {
                                contextt.read<StatisticsCubit>().loadMusic();
                                BlocProvider.of<StatisticsCubit>(contextt).isDownloading?contextt.read<StatisticsCubit>().addAudioFile(audioUrl: '${ApiConst.BASE_URL}${data['music']}.mp3' ):contextt.read<StatisticsCubit>().isStop();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
            left: 20.w,
            child: DiskAnimation(
              radius: 35.r,
              image:  CachedNetworkImageProvider('${ApiConst.BASE_URL}${data['img']!}'),
              isAnimation: contextt.watch<StatisticsCubit>().isPlay,
            )),
      ],
    ),
  );
}
