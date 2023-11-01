
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextWidget extends StatelessWidget {
  String text;
  TextAlign? positionText;
  Color color;
  double fontSize;
  FontWeight fontWeight;
  TextDecoration decoration;
  double? wordSpacing;
    CustomTextWidget({Key? key,
    required this.text,
    this.decoration = TextDecoration.none,
    this.positionText,
    this.color = Colors.white,
    this.fontWeight = FontWeight.w500,
    required this.fontSize,
      this.wordSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: positionText,
      style: TextStyle(
       decoration: decoration,
          decorationThickness: 1.5,
          wordSpacing: wordSpacing,
          decorationStyle: TextDecorationStyle.solid,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
  }
}


class RichTextDetailPage extends StatelessWidget {
  final String name;
  final String desc;
  const RichTextDetailPage({super.key,required this.name,required this.desc});

  @override
  Widget build(BuildContext context) {
    return  RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "$name: ",
            style:  TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(text: desc,style:  TextStyle(fontSize: 17.sp),),
        ],
      ),
    );
  }
}
