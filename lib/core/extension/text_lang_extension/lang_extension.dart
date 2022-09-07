import 'package:easy_localization/easy_localization.dart';

extension StringLocalixation on String{
  String get locale => this.tr();
  String get t => locale;
}