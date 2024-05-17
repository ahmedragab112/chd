import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/motion_toast.dart';

void successToast(context, {String? title, String? description}) {
  MotionToast.success(
    dismissable: false,
    toastDuration: const Duration(seconds: 5),
    width: 330.w,
    height: 80.h,
    title: Text("$title",
        style: const TextStyle(color: Colors.black, fontSize: 16)),
    description: Text(
      description ?? '',
      style: const TextStyle(color: Colors.black, fontSize: 12),
      textAlign: TextAlign.center,
    ),
    animationType: AnimationType.fromTop,
    position: MotionToastPosition.top,
  ).show(context);
}

void errorToast(context, {String? title, String? description}) {
  MotionToast.error(
    toastDuration: const Duration(seconds: 5),
    dismissable: false,
    width: 330.w,
    height: 80.h,
    title: Text("$title",
        style: const TextStyle(color: Colors.black, fontSize: 16)),
    description: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(description ?? '',
          style: const TextStyle(color: Colors.black, fontSize: 12)),
    ),
    animationType: AnimationType.fromTop,
    position: MotionToastPosition.top,
  ).show(context);
}
