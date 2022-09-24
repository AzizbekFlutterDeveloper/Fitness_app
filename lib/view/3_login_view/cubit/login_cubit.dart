import 'package:fitness_app/view/3_login_view/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  int tabBarCurrent = 0;

  void changeCurrent(int i){
    tabBarCurrent = i;
    emit(TabBarState());
  }
}