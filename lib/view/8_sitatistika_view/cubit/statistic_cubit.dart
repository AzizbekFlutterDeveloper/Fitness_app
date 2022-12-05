import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:fitness_app/core/constants/color_const/color_const.dart';
import 'package:fitness_app/core/extension/size_extension/size_extension.dart';
import 'package:fitness_app/service/exercisea_service/set_user_info.dart';
import 'package:fitness_app/view/8_sitatistika_view/cubit/statistics_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  StatisticsCubit() : super(StatiscticsInitial());

  List<bool> isDownloading = [];
  List<bool> isDiskAnimation = [];
  void loadMusic(int index) {
    isDownloading[index] = !isDownloading[index];
    emit(LoadState());
  }

  final audioPlayer = AssetsAudioPlayer();

  List<AssetsAudioPlayer> audioPlayes = [];

  bool isPlay = false;

  addListFalse(int length) {
    isDownloading = List.generate(length, (index) => false);
    isDiskAnimation = List.generate(length, (index) => false);
    audioPlayes = List.generate(
      length,
      (index) => AssetsAudioPlayer(),
    );
    emit(LoadState());
  }

  var audio;

  void addAudioFile({
    required String audioUrl,
    String? title,
    String? artist,
    String? album,
    String? imageUrl,
  }) {
    audio = Audio.file(
      audioUrl,
      metas: Metas(
        title: title,
        album: album,
        artist: artist,
        image: MetasImage.network(
          imageUrl ??
              "https://img.freepik.com/premium-vector/audiobooks-logo-listen-literature-e-books-audio-format-books-online-mobile-application-flat-icon-online-audiobook-with-headphones-distance-education-e-learning-podcast-webinar-tutorial_435184-201.jpg?w=2000",
        ),
      ),
    );

    audioPlayer.open(
      audio,
      autoStart: false,
      notificationSettings:
          NotificationSettings(customPlayPauseAction: ((player) {
        audioPlay();
      })),
    );

    addPosition();
  }

  void isStop() {
    audioPlayer.stop();
    
    emit(MucisStap());
  }

  void audioPlay() {
    isPlay = !isPlay;
    isPlay ? audioPlayer.play() : audioPlayer.pause();
    emit(LoadState());
  }

  void audioSeek(var value) {
    final position = Duration(seconds: value.toInt());
    audioPlayer.seekBy(position);
  }

  positionAndDuration() {
    return audioPlayer.builderRealtimePlayingInfos(
      builder: (context, play) {
        return Text(
          "${"${play.currentPosition}".split(".")[0]} / ${"${play.duration}".split('.')[0]}",
          style: const TextStyle(color: Colors.white),
        );
      },
    );
  }

  addPosition({
    BuildContext? context,
    String? name,
    String? artistname,
  }) {
    return audioPlayer.builderRealtimePlayingInfos(
      builder: (BuildContext context, RealtimePlayingInfos play) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: context.w),
            GestureDetector(
              child: CircleAvatar(
                radius: 16.r,
                backgroundColor: Colors.black.withOpacity(0.5),
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
              onTap: () {
                audioPlayer.stop();
                Navigator.pop(context);
              },
            ),
            Spacer(),
            Text(
              name??"No Name",
              style: TextStyle(
                color: Colors.white,
                fontSize: 23.sp,
              ),
            ),
            Text(
              artistname??"No Auther",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(height: 15.h),
            SliderTheme(
              data: SliderThemeData(
                  overlayShape: SliderComponentShape.noThumb,
                  trackHeight: 10.h,
                  thumbColor: ColorConst.instance.kPrimaryColor,
                  inactiveTrackColor: Colors.black.withOpacity(0.5),
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 0.0)),
              child: Slider(
                value: play.currentPosition.inSeconds.toDouble(),
                max: play.duration.inSeconds.toDouble(),
                activeColor: ColorConst.instance.kPrimaryColor,
                onChanged: (v) {
                  final position = Duration(seconds: v.toInt());
                  audioPlayer.seek(position);
                },
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Text("${play.currentPosition}".split(".")[0],style: TextStyle(color: ColorConst.instance.white),),
               Text("${play.duration}".split(".")[0],style: TextStyle(color: ColorConst.instance.white),)
              ],
            ),
            SizedBox(height: 25.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    audioSeek(-10);
                  },
                  icon: Icon(
                    Icons.skip_previous_rounded,
                    color: Colors.white,
                    size: 40.sp,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    audioPlay();
                  },
                  icon: Icon(
                    isPlay?Icons.pause_outlined:  Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 50.sp,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    audioSeek(10);
                  },
                  icon: Icon(
                    Icons.skip_next_rounded,
                    color: Colors.white,
                    size: 40.sp,
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }

  // addPosition(AudioBookModel audioBook) {
  //   return audioPlayer.builderRealtimePlayingInfos(
  //     builder: (context, play) {
  //       isPlay = play.isPlaying;
  //       return Expanded(
  //         child: Column(
  //           children: [
  //             SizedBox(height: 48.h),
  //             DiskAnimation(
  //               image:
  //                   CachedNetworkImageProvider(audioBook.book.image.toString()),
  //               isAnimation: play.isPlaying,
  //               radius: 102.h,
  //             ),
  //             SizedBox(height: 24.h),
  //             Text(
  //               audioBook.book.title!,
  //               style: TextStyleComp.styleBlack500(size: 22),
  //               overflow: TextOverflow.ellipsis,
  //               maxLines: 2,
  //             ),
  //             SizedBox(height: 16.h),
  //             Text(
  //               audioBook.book.author!.firstname! +
  //                   " " +
  //                   audioBook.book.author!.lastname!,
  //               style: TextStyleComp.styleGrey500(size: 15),
  //               overflow: TextOverflow.ellipsis,
  //               textAlign: TextAlign.center,
  //             ),
  //             Spacer(),
  //             Container(
  //               height: 288.h,
  //               padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
  //               width: double.infinity,
  //               color: ColorConst.instance.white,
  //               child: Column(
  //                 children: [
  //                   SliderTheme(
  //                     data: SliderThemeData(
  //                       trackHeight: 6.h,
  //                       inactiveTrackColor:
  //                           ColorConst.instance.black.withOpacity(0.1),
  //                       thumbShape:
  //                           RoundSliderThumbShape(enabledThumbRadius: 7.h),
  //                       overlayShape: SliderComponentShape.noThumb,
  //                     ),
  //                     child: Slider(
  //                       onChanged: (v) {
  //                         final position = Duration(seconds: v.toInt());
  //                         audioPlayer.seek(position);
  //
  //                       },
  //                       value: play.currentPosition.inSeconds.toDouble(),
  //                       max: play.duration.inSeconds.toDouble(),
  //                     ),
  //                   ),
  //                   SizedBox(height: 5.h),
  //                   Row(
  //                     children: [
  //                       Text("${play.currentPosition}".split(".")[0],
  //                           style: TextStyleComp.styleBlack500(size: 15)),
  //                       const Spacer(),
  //                       Text("${play.duration}".split('.')[0],
  //                           style: TextStyleComp.styleBlack500(size: 15)),
  //                     ],
  //                   ),
  //                   SizedBox(height: 24.h),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                     children: [
  //                       GestureDetector(
  //                         child: CircleAvatar(
  //                           radius: 28.r,
  //                           backgroundColor:
  //                               ColorConst.instance.scaffoldBackgroundColor,
  //                           child:
  //                               SvgPicture.asset("assets/icons/Backward.svg"),
  //                         ),
  //                         onTap: () {
  //                           audioSeek(-15);
  //                         },
  //                       ),
  //                       GestureDetector(
  //                         child: CircleAvatar(
  //                           radius: 38.r,
  //                           backgroundColor:
  //                               ColorConst.instance.scaffoldBackgroundColor,
  //                           child: SvgPicture.asset(
  //                             play.isPlaying
  //                                 ? "assets/icons/pause.svg"
  //                                 : "assets/icons/play.svg",
  //                             color: ColorConst.instance.black.withOpacity(0.9),
  //                             height: 47.h,
  //                           ),
  //                         ),
  //                         onTap: () {
  //                           audioPlay();
  //                         },
  //                       ),
  //                       GestureDetector(
  //                         child: CircleAvatar(
  //                           radius: 28.r,
  //                           backgroundColor:
  //                               ColorConst.instance.scaffoldBackgroundColor,
  //                           child: SvgPicture.asset("assets/icons/Forward.svg"),
  //                         ),
  //                         onTap: () {
  //                           audioSeek(15);
  //                         },
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
}
