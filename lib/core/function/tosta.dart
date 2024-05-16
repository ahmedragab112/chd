import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/motion_toast.dart';

void successToast(context, {String? title, String? description}) {
  MotionToast.success(
    width: 330.w,
    height: 80.h,

    title: Text("$title",
        style: const TextStyle(color: Colors.black, fontSize: 16)),
    description: Text(description ?? '',
        style: const TextStyle(color: Colors.black, fontSize: 12)),
    animationType: AnimationType.fromBottom,
    position: MotionToastPosition.bottom,
  ).show(context);
}

void errorToast(context, {String? title, String? description}) {
  MotionToast.error(
    height: 80.h,
    title: Text("$title",
        style: const TextStyle(color: Colors.black, fontSize: 16)),
    description: Text(description ?? '',
        style: const TextStyle(color: Colors.black, fontSize: 12)),
    animationType: AnimationType.fromBottom,
    position: MotionToastPosition.bottom,
  ).show(context);
}
