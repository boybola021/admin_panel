import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../services/strings.dart';

class KTForgotTextWidget extends StatelessWidget {
  const KTForgotTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      KTStrings.forgotPassword,
      style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: Colors.red.shade900),
    );
  }
}
