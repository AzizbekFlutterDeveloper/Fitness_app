import 'package:fitness_app/view/2_on_bording_view/cubit/on_bording_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBordingCubit extends Cubit<OnBordingState> {
  OnBordingCubit() : super(OnBordingInitial());

  int dotsCount = 0;

  void addDotsCount(int count){
    dotsCount = count;
    emit(CountState());
  }
}