import 'package:fitness_app/service/exercisea_service/set_user_info.dart';
import 'package:fitness_app/view/8_sitatistika_view/cubit/statistics_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  StatisticsCubit() : super(StatiscticsInitial());

  bool isDownloading = false;

  void loadMusic() {
    isDownloading = true;
    emit(LoadState());
  }
}
