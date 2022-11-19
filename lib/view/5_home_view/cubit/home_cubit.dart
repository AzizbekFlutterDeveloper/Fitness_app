import 'package:fitness_app/core/constants/enums/locale_kays_enum.dart';
import 'package:fitness_app/view/5_home_view/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int bottomCurrentIndex = 0;
  int tabBarCurrentIndex = 0;

  int langINdex = 0;

  void changeLang(int index){
    GetStorage().write(PreferenceKeys.TOKEN.toString(), index);
    emit(TabBarState());
  }

  void changeBottomIndex(int index){
    bottomCurrentIndex = index;
    emit(BottomState());
  }

  void changeTabBarIndex(int tabIndex){
    tabBarCurrentIndex = tabIndex;
    emit(TabBarState());
  }
}