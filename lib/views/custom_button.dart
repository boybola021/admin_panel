

import 'package:admin_panel/services/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback page;
  const CustomButton({Key? key, required this.text, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final y = MediaQuery.sizeOf(context).height;
    final x = MediaQuery.sizeOf(context).width;
    return  ElevatedButton(
      onPressed: page,
      style: ElevatedButton.styleFrom(
        backgroundColor: KTColors.orange,
        fixedSize: Size(x, y / 16),
      ),
      child:  Text(text,style: const TextStyle(fontSize: 25),),
    );
  }
}
