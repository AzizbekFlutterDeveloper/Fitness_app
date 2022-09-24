import 'package:fitness_app/view/4_aboute_view/cubit/aboute_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AbouteCubit extends Cubit<AbouteState> {
  AbouteCubit() : super(AbouteInitial());

  bool? gender;
  int age = 1;
  int kg = 0;

  void chandeGenter(bool value){
    gender = value;
    emit(GenderState());
  }

  void chanegeAge(int value){
    age = value;
    emit(GenderState());
  }

  void chanegeKg(int valu){
    kg = valu;
    emit(GenderState());
  }
}