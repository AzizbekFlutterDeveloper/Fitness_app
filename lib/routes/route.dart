import 'package:fitness_app/core/constants/navigation_const/navigation_const.dart';
import 'package:fitness_app/view/on_bording_view/on_bording_view.dart';
import 'package:flutter/material.dart';

class MyRoutes {
  static MyRoutes? _instance;
  static MyRoutes get instance {
    _instance ??= MyRoutes._init();
    return _instance!;
  }

  MyRoutes._init();

  Route ongenerateRoute(RouteSettings settings) {
    var args = settings.arguments;

    switch (settings.name) {
      case NavigationConst.ON_BORDING:
        return normalNavigate(OnBording());
      
      default:
        return normalNavigate(const OnBording());
    }
  }

  // * FOR EASY NAVIGATION :)
  MaterialPageRoute normalNavigate(Widget widget) => MaterialPageRoute(
        builder: (ctx) => widget,
  );
}