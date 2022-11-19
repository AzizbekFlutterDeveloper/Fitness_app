import 'dart:io';

import 'package:fitness_app/core/constants/enums/locale_kays_enum.dart';
import 'package:fitness_app/core/init/cache/cache_manager.dart';
import 'package:fitness_app/view/3_login_view/cubit/login_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
   
  final box = GetStorage();

  int tabBarCurrent = 0;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController againPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  String jinsi = "";
  int yoshi = 0;
  int vazni = 0;
  int boyi = 0;
  String ishi = "";
  File imageFile = File("");
  
  final ImagePicker picker = ImagePicker();


  void changeJinsi(String jin){
    jinsi = jin;
    emit(NameState());
  }

  void changeyohi(int yo){
    yoshi = yo;
    emit(NameState());
  }
  void changeVazni(int vaz){
    vazni = vaz;
    emit(NameState());
  }
  void changeBoyi(int boy){
    boyi = boy;
    emit(NameState());
  }
  void changeIshi(String ish){
    ishi = ish;
    emit(NameState());
  }

  final formKey = GlobalKey<FormState>();
  
  void changeCurrent(int i){
    tabBarCurrent = i;
    emit(TabBarState());
  }

  changeImage()async{
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    imageFile = File(image!.path);
    emit(NameState());
  }

  void addController(){
    nameController.text = box.read(PreferenceKeys.NAME.toString());
    emailController.text = box.read(PreferenceKeys.EMAIL.toString());
    imageFile = File(box.read(PreferenceKeys.IMAGE.toString()));
    emit(NameState());
  }

  void addName()async{
    String date = DateTime.now().toString();
    box.write(PreferenceKeys.NAME.toString(), nameController.text);
    box.write(PreferenceKeys.EMAIL.toString(), emailController.text);
    box.write(PreferenceKeys.PASSWORD.toString(), passwordController.text);
    box.write(PreferenceKeys.DATE.toString(), date);
    box.write(PreferenceKeys.ISTRUE.toString(), "true");
    emit(NameState());
  }

  Future changeName()async{
    box.write(PreferenceKeys.NAME.toString(), nameController.text);
    box.write(PreferenceKeys.EMAIL.toString(), emailController.text);
    box.write(PreferenceKeys.IMAGE.toString(), imageFile.path);
    emit(NameState());
  }
}