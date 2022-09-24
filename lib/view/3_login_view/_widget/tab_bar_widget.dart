import 'package:fitness_app/core/constants/color_const/color_const.dart';
import 'package:fitness_app/view/3_login_view/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarWidget extends StatefulWidget {
  final BuildContext contextt;
  const TabBarWidget({Key? key,required this.contextt}) : super(key: key);

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26.h,
      width: 136.w,
      child: TabBar(
        padding: const EdgeInsets.all(0),
        labelPadding: const EdgeInsets.all(0),
        indicatorPadding: const EdgeInsets.all(0),
        indicatorSize: TabBarIndicatorSize.label,
        controller: controller,
        onTap: (v){
          widget.contextt.read<LoginCubit>().changeCurrent(v);
        },
        tabs: [
          Tab(
            icon: Text(
              "Kirish",
              style: TextStyle(
                color: ColorConst.instance.white,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            iconMargin: const EdgeInsets.all(0),
          ),
          Tab(
            icon: Text(
              "Register",
              style: TextStyle(
                color: ColorConst.instance.white,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            iconMargin: const EdgeInsets.all(0),
          ),
        ],
      ),
    );
  }
}
