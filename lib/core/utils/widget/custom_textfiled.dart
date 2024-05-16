import 'package:chdtask/core/utils/styles/app_textstyle.dart';
import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {super.key,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.controller,
      this.obscureText = false,
      this.validator,
      this.type = TextInputType.text});

  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyle.font14GreySemiBold
          .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
      keyboardType: type,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      controller: controller,
    );
  }
}
