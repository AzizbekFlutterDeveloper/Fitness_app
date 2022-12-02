import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:fitness_app/core/constants/color_const/color_const.dart';
import 'package:fitness_app/service/exercisea_service/set_user_info.dart';
import 'package:fitness_app/view/8_sitatistika_view/cubit/statistics_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  StatisticsCubit() : super(StatiscticsInitial());

  bool isDownloading = false;

  void loadMusic() {
    isDownloading = !isDownloading;
    emit(LoadState());
  }

  final audioPlayer = AssetsAudioPlayer();

  bool isPlay = false;

  var audio = Audio.network(
    "https://96.f.1ting.com/local_to_cube_202004121813/96kmp3/2021/04/16/16b_am/01.mp3",
    metas: Metas(
      title: "Country",
      artist: "Florent Champigny",
      album: "CountryAlbum",
      image: const MetasImage.network(
        "https://www.theater.nl/assets/Voorstelling/Thumbnail/Microfoon-Unsplash__CompressedW10.jpg",
      ), //can be MetasImage.network
    ),
  );

  void addAudioFile({
    required String audioUrl,
    String? title,
    String? artist,
    String? album,
    String? imageUrl,
  }) {
    audio = Audio.network(
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
      autoStart: true,
      showNotification: true,
      notificationSettings: NotificationSettings(
        customPlayPauseAction: ((player) {
          audioPlay();
        }),
      ),
    );
    audioPlay();
    // addPosition();
  }
  void isStop(){
    audioPlayer.stop();
    emit(LoadState());
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
          "${play.currentPosition}".split(".")[0] +
              " / " +
              "${play.duration}".split('.')[0],
          style: TextStyle(color: Colors.white),
        );
      },
    );
  }

  addPosition({String? name, String? artistname}) {
    return audioPlayer.builderRealtimePlayingInfos(
      builder: (BuildContext context, RealtimePlayingInfos play) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              name?? "No name",
              style: TextStyle(
                  color: ColorConst.instance.kPrimaryColor, fontSize: 17.h),
              overflow: TextOverflow.clip,
              maxLines: 2,
            ),
            Text(
              artistname??"No auther",
              style: TextStyle(
                  color: ColorConst.instance.kPrimaryColor, fontSize: 14.h),
              overflow: TextOverflow.clip,
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [positionAndDuration()],
            ),
            SliderTheme(
              data: SliderThemeData(
                  overlayShape: SliderComponentShape.noThumb,
                  trackHeight: 5.h,
                  thumbColor: ColorConst.instance.kPrimaryColor,
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
