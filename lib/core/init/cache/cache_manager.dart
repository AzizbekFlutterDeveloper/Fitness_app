import 'package:fitness_app/core/constants/enums/locale_kays_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleManeger {
  static final LocaleManeger _instance = LocaleManeger._init();
  SharedPreferences? _preferences;
  static LocaleManeger get instance => _instance;
  
  LocaleManeger._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  static preferenceInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> setStringValue(PreferenceKeys key, String value) async {
  //  await _preferences!.setString(key.toString(), value);
  }

  Future<void> setDoubelValue(PreferenceKeys key, double value) async {
    await _preferences!.setDouble(key.toString(), value);
  }

  Future<void> setListValue(PreferenceKeys key, List<String> value) async{
    await _preferences!.setStringList(key.toString(), value);
  }

  List<String>? getListValue(PreferenceKeys key) => _preferences!.getStringList(key.toString()) ?? [];

  String? getStringValue(PreferenceKeys key) =>
      _preferences!.getString(key.toString()) ?? "";
  
  double? getDoubleValue(PreferenceKeys key) =>
      _preferences!.getDouble(key.toString()) ?? 0.0;
}