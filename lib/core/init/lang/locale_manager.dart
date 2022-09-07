import 'package:flutter/cupertino.dart';

class LangManager{
  static LangManager? _instance;
  static LangManager get instance {
    _instance ??= LangManager._init();
    return _instance!;
  }

  LangManager._init();

  final uzLocale =  const Locale("uz","UZ");
  final enLocale = const Locale('en',"US");
  final ruLocale = const Locale("ru","RU");

  List<Locale> get supportLocale => [
    uzLocale,
    enLocale,
    ruLocale,
  ];
}