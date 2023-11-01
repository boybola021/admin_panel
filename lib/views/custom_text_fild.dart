

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final VoidCallback? onPressed;
  final void Function(String)? onSubmitted;
  final String hintText;
  final bool readOnly;
  final bool obscureText;
  final int? maxLine;
  const CustomTextField({super.key,
    required this.controller,this.prefixIcon,
    this.keyboardType,this.onPressed, this.readOnly = false,
    required this.hintText, this.onSubmitted,
    this.suffix,
    this.obscureText = false,
    this.maxLine,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLine,
      onSubmitted: onSubmitted,
      obscureText: obscureText,
      readOnly: readOnly,
      controller: controller,
      onTap: onPressed,
      keyboardType: keyboardType,
      style: const TextStyle(fontSize: 20,),
      decoration:  InputDecoration(
        border: const OutlineInputBorder(),
        prefixIcon: prefixIcon,
        suffixIcon: suffix,
        hintText: hintText,
        filled: true,
      ),
    );
  }
}