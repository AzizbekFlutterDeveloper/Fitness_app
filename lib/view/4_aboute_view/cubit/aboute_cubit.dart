import 'package:fitness_app/core/constants/enums/locale_kays_enum.dart';
import 'package:fitness_app/core/init/cache/cache_manager.dart';
import 'package:fitness_app/core/init/lang/locale_keys.g.dart';
import 'package:fitness_app/view/4_aboute_view/cubit/aboute_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

class AbouteCubit extends Cubit<AbouteState> {
  AbouteCubit() : super(AbouteInitial());

  bool? gender;
  int age = 1;
  int kg = 0;
  int boyi = 0;
  String ishi = "";
  bool isEmpty = false;

  void chandeGenter(bool value){
    gender = value;
    emit(GenderState());
  }

  void addGenter(){
    isEmpty = false;
    LocaleManeger.instance.setStringValue(PreferenceKeys.JINSI, (gender!? "Erkak":"Ayol"));
    emit(GenderState());
  }

  void addAge(){
    isEmpty = false;
    LocaleManeger.instance.setStringValue(PreferenceKeys.AGE, age.toString());
    emit(GenderState());
  }
  void addVazni(){
    isEmpty = false;
    LocaleManeger.instance.setStringValue(PreferenceKeys.VAZNI, kg.toString());
    emit(GenderState());
  }
  void addBoyi(){
    isEmpty = false;
    LocaleManeger.instance.setStringValue(PreferenceKeys.BOY, boyi.toString());
    emit(GenderState());
  }
   void addIshi(){
    isEmpty = false;
    GetStorage().write(PreferenceKeys.ISTRUE.toString(),"true");
    LocaleManeger.instance.setStringValue(PreferenceKeys.ISH, ishi);
    emit(GenderState());
  }
  
  void chanegeAge(int value){
    age = value;
    if(value > 7){
      isEmpty = true;
    }
    emit(GenderState());
  }

  void chanegeKg(int valu){
    if(valu > 25 ){
      isEmpty = true;
    }
    kg = valu;
    emit(GenderState());
  }

  void chanegeBoyi(int valu){
    if(valu > 70){
      isEmpty = true;
    }
    kg = valu;
    emit(GenderState());
  }

  void chanegeIshi(String valu){
    isEmpty = true;
    ishi = valu;
    emit(GenderState());
  }
 


}