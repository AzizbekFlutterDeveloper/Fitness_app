import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/core/constants/api_consts/api_consts.dart';
import 'package:fitness_app/core/constants/color_const/color_const.dart';
import 'package:fitness_app/core/extension/size_extension/size_extension.dart';
import 'package:fitness_app/view/8_sitatistika_view/cubit/statistic_cubit.dart';
import 'package:fitness_app/view/8_sitatistika_view/cubit/statistics_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';



class MusicPage extends StatelessWidget{
  final dynamic data;
  const MusicPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        var cubit = StatisticsCubit();
        cubit.isStop();
        cubit.addAudioFile(audioUrl: '${ApiConst.BASE_URL}${data['music']}.mp3');
        return cubit;
      },
      child: BlocConsumer<StatisticsCubit, StatisticsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return _musicScaffold(context);
        },
      ),
    );
  }
  
  WillPopScope _musicScaffold(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
        body: Container(
          height: context.h,
          width: context.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(
                '${ApiConst.BASE_URL}${data['img']!}'),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
            child: context.read<StatisticsCubit>().addPosition(
              artistname: data['artistName'],
              name: data['musicName'],

            ),
          ),
        ),
      ),
    );
  }

  
}
