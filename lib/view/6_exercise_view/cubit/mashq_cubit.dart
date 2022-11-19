import 'package:fitness_app/view/6_exercise_view/cubit/mashq_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MashqCubit extends Cubit<MashqState> {
  MashqCubit() : super(MashqInitial());

  bool isVisiblitiy = false;
  int imgIndex = 0;

  void addVisiblitiy(bool visible,int index){
    isVisiblitiy = visible;
    imgIndex = index;
    emit(VisibilityState());
  }
}