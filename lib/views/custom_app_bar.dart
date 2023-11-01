import 'package:admin_panel/services/colors.dart';
import 'package:admin_panel/views/text_view_all.dart';
import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget {
  final String text;
  final Alignment alignment;
  final double fontSize;
  final double height;
  final Widget? button;
  const CustomAppBar({Key? key,required this.text,this.alignment = Alignment.topCenter,this.fontSize = 35,this.height = 0.0, this.button,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    return  Align(
      alignment: alignment,
      child: Container(
        height: height == 0.0 ? h * 0.18 : height,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: KTColors.pink,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
        ),
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Align(
                // alignment: Alignment.centerLeft,
                  child: button
              ),
              const Spacer(),
              CustomTextWidget(
                  text: text,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
