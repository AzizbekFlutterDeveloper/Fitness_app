import 'package:fitness_app/core/constants/navigation_const/navigation_const.dart';
import 'package:fitness_app/model/mashq_model.dart';
import 'package:fitness_app/view/1_splash_view/splash_view.dart';
import 'package:fitness_app/view/2_on_bording_view/on_bording_view.dart';
import 'package:fitness_app/view/3_login_view/login_view.dart';
import 'package:fitness_app/view/4_aboute_view/age_view.dart';
import 'package:fitness_app/view/4_aboute_view/gender_view.dart';
import 'package:fitness_app/view/4_aboute_view/height_view.dart';
import 'package:fitness_app/view/4_aboute_view/job_view.dart';
import 'package:fitness_app/view/4_aboute_view/width_view.dart';
import 'package:fitness_app/view/5_home_view/home_view.dart';
import 'package:fitness_app/view/6_exercise_view/exercise_view.dart';
import 'package:fitness_app/view/7_notification_view/notification_view.dart';
import 'package:fitness_app/view/8_sitatistika_view/sitatistika_view.dart';
import 'package:fitness_app/view/9_profile_view/about_page/about_page.dart';
import 'package:fitness_app/view/9_profile_view/change_lang/change_lang_view.dart';
import 'package:fitness_app/view/9_profile_view/profile_edit/profile_edit_view.dart';
import 'package:fitness_app/widget/bottom_nav_bar.dart';
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
        return normalNavigate(const OnBording());
      case NavigationConst.SPLASH_VIEW:
        return normalNavigate(const SplashView());
      case NavigationConst.LOGIN_VIEW:
        return normalNavigate(const LoginView());
      case NavigationConst.GENDER:
        return normalNavigate(const GenderView());
      case NavigationConst.AGE:
        return normalNavigate(const AgeView());
      case NavigationConst.WIDTH:
        return normalNavigate(const WidthView());
      case NavigationConst.HEIGHT:
        return normalNavigate(const HeightView());
      case NavigationConst.JOB:
        return normalNavigate(const JobView());
       case NavigationConst.HOME:
        return normalNavigate(BottomNavBar());
      case NavigationConst.PROFILE_EDIT:
        return normalNavigate(ProfileEtit());
      case NavigationConst.CHANGE_LANG:
        return normalNavigate(ChangaLangView());
        case NavigationConst.INSIGHT:
        return normalNavigate(HealthApp());
       case NavigationConst.ABOUT:
        return normalNavigate(AboutPage());
      case NavigationConst.EXERCISE:
        return normalNavigate( ExerciseView( dataList: args as HomeModel,));
      default:
        return normalNavigate(const OnBording());
    }
  }

  // * FOR EASY NAVIGATION :)
  MaterialPageRoute normalNavigate(Widget widget) => MaterialPageRoute(
        builder: (ctx) => widget,
  );
}