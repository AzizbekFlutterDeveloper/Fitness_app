import 'package:fitness_app/view/6_exercise_view/cubit/mashq_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MashqCubit extends Cubit<MashqState> {
  MashqCubit() : super(MashqInitial());

  bool isVisiblitiy = false;
  int imgIndex = 0;
  String img = '';
  String name = '';

  void addVisiblitiy(bool visible, int index, String imge) {
    isVisiblitiy = visible;
    imgIndex = index;
    img = imge;
    emit(VisibilityState());
  }

  String getLang(String name) {
    switch (name) {
      case 'Qo\'llar uchun':
        return 'nameUz';
      case 'Упражнения для мышц рук':
        return 'nameRu';
      case 'Oyoqlar uchun':
        return 'nameUz';
      case 'Упражнения для мышц ног':
        return 'nameRu';
      case 'Press uchun':
        return 'nameUz';
      case 'Упражнения для прямой мышцы живота':
        return 'nameRu';
      case 'Turnik':
        return 'nameUz';
      case 'Упражнения на перекладине':
        return 'nameRu';
      case 'Brus':
        return 'nameUz';
      case 'Упражнения на брусьях':
        return 'nameRu';
      default:
        return 'nameUz';
    }
  }

  String getCategory(String name) {
    switch (name) {
      case 'Qo\'llar uchun':
      case 'Для рук':
        return 'Qol';
      case 'Oyoqlar uchun':
      case 'Для ног':
        return 'Ayoq';
      case 'Press uchun':
      case 'Для прессы':
        return 'Pres';
      case 'Turnik':
      case 'Tурник':
        return 'Turnik';
      case 'Brus':
      case 'Брюс':
        return 'Burus';
      default:
        return 'Qol';
    }
  }
}
