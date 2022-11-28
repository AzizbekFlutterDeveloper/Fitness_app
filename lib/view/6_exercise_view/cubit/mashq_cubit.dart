import 'package:fitness_app/view/6_exercise_view/cubit/mashq_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MashqCubit extends Cubit<MashqState> {
  MashqCubit() : super(MashqInitial());

  bool isVisiblitiy = false;
  int imgIndex = 0;
  String img = '';

  void addVisiblitiy(bool visible, int index, String imge) {
    isVisiblitiy = visible;
    imgIndex = index;
    img = imge;
    emit(VisibilityState());
  }

  String getCategory(String name) {

        switch (name) {
      case 'Qo\'llar uchun':
        return 'Qol';
      case 'Oyoqlar uchun':
        return 'Ayoq';
      case 'Press uchun':
        return 'Pres';
      case 'Turnik':
        return 'Turnik';
      case 'Brus':
        return 'Burus';
      default:
        return 'Qol';
    }
  }
}
