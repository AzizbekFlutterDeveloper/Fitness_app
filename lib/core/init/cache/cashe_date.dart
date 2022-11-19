import 'package:fitness_app/core/constants/enums/locale_kays_enum.dart';
import 'package:get_storage/get_storage.dart';

class CashedData{
  static init(){
    final box = GetStorage();

    box.write(PreferenceKeys.NAME.toString(), "");
    box.write(PreferenceKeys.EMAIL.toString(), "");
    box.write(PreferenceKeys.PASSWORD.toString(), "");
    box.write(PreferenceKeys.DATE.toString(), "");
    box.write(PreferenceKeys.AGE.toString(), "");
    box.write(PreferenceKeys.BOY.toString(), "");
    box.write(PreferenceKeys.ISH.toString(), "");
    box.write(PreferenceKeys.JINSI.toString(), "");
    box.write(PreferenceKeys.VAZNI.toString(), "");
    box.write(PreferenceKeys.ISTRUE.toString(), "");
    box.write(PreferenceKeys.IMAGE.toString(), "");
    box.write(PreferenceKeys.TOKEN.toString(), 0);

  }
}