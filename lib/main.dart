import 'package:bloc/bloc.dart';
import 'package:chdtask/app/chd.dart';
import 'package:chdtask/core/di/di.dart';
import 'package:chdtask/core/service/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setupLocator();
  await ScreenUtil.ensureScreenSize();
  runApp(const Chd());
}
