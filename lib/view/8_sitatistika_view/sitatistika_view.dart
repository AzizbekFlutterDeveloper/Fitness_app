import 'package:fitness_app/service/exercisea_service/set_user_info.dart';
import 'package:fitness_app/view/8_sitatistika_view/_widget/music_list.dart';
import 'package:fitness_app/view/8_sitatistika_view/cubit/statistic_cubit.dart';
import 'package:fitness_app/view/8_sitatistika_view/cubit/statistics_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as debugger;

class HealthApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return 
    
    
    
    FutureBuilder(
      future: FirebaseServise().getMusics(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        var error = 'containerdagi malumotlar ${snapshot.data.toString()}';
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
          debugger.log('$documentData');
          return BlocProvider(
      create: (context) => StatisticsCubit(),
      child: BlocConsumer<StatisticsCubit, StatisticsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MusicList(contextt: context, data: documentData,);
        },
      ),
    ); ;
          
          
          }});
          
  }
          
          
          
          
        
      
      }

   


 
  
