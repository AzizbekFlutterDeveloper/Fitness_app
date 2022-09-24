import 'package:fitness_app/view/5_home_view/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int bottomCurrentIndex = 0;
  int tabBarCurrentIndex = 0;

  void changeBottomIndex(int index){
    bottomCurrentIndex = index;
    emit(BottomState());
  }

  void changeTabBarIndex(int tabIndex){
    tabBarCurrentIndex = tabIndex;
    emit(TabBarState());
  }
}