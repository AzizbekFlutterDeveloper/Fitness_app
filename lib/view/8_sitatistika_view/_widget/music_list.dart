import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/core/constants/api_consts/api_consts.dart';
import 'package:fitness_app/core/constants/color_const/color_const.dart';
import 'package:fitness_app/service/exercisea_service/set_user_info.dart';
import 'package:fitness_app/view/8_sitatistika_view/cubit/statistic_cubit.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as debugger;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MusicList extends StatelessWidget {
  late BuildContext context;
  MusicList({
    required this.context,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseServise().getMusics(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        var error = 'containerdagi malumotlar ${snapshot.data.toString()}';
        debugger.log('${snapshot.data}');
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

          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              return _musicContainer(documentData[index]);
            },
          );
        }
      },
    );
  }
}

Widget _musicContainer(Map<String, dynamic> data) {
  return Material(
    color: Colors.transparent,
    child: Container(
      height: 76.h,
      width: 327.w,
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 7.5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: ColorConst.instance.grey,
      ),
      child: Row(
        children: [
          SizedBox(
            height: 70.h,
            width: 70.w,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(55.r)),
              // child: FadeInImage.assetNetwork(
              //   fit: BoxFit.cover,
              //   placeholder: "assets/images/singup.png",
              //   image: '${ApiConst.BASE_URL}${data['img']}',
              // ),
              child: Image.asset("assets/images/singup.png"),
            ),
          ),
          SizedBox(width: 15.w),
          SizedBox(
            width: 200.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Stan',
                  style: TextStyle(
                      color: ColorConst.instance.kPrimaryColor, fontSize: 22.h),
                  overflow: TextOverflow.clip,
                  maxLines: 2,
                ),
                Text(
                  'Eminem',
                  style: TextStyle(
                      color: ColorConst.instance.kPrimaryColor, fontSize: 18.h),
                  overflow: TextOverflow.clip,
                  maxLines: 2,
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
