

import 'package:admin_panel/services/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

sealed class KTIcons{
  static const visibilityOff = Icon(Icons.visibility_off);
  static const visibility =  Icon(Icons.visibility);
  static final email =   Icon(Icons.email_outlined,size: 30.sp,);
  static final lock =  Icon(CupertinoIcons.lock,size: 30.sp,);
  static final delete =  Icon(CupertinoIcons.delete,size: 25.sp,);

  static  Icon time = Icon(Icons.access_time_outlined,size: 30.sp,color: KTColors.pink,);
  static  Icon calendar = Icon(Icons.calendar_month,size: 30.sp,color: KTColors.pink,);
  static  Icon personOrder = Icon(Icons.person,size: 30.sp,color: KTColors.pink,);
  static  Icon personAdd = Icon(Icons.person_add_alt_1,size: 30.sp,color: KTColors.pink,);
  static  Icon phone = Icon(Icons.phone,size: 30.sp,color: KTColors.pink,);


  static Icon add = Icon(Icons.add,size: 50.sp,);
  static Icon rename = Icon(Icons.drive_file_rename_outline,size: 30.sp,);
  static Icon description = Icon(Icons.description,size: 30.sp,);
  static Icon price = Icon(Icons.price_change,size: 30.sp,);
  static Icon category = Icon(Icons.qr_code_rounded,size: 30.sp,);


  /// #BatoomNavigationButtonIcons
  static final Icon home = Icon(CupertinoIcons.home,size: 25.sp,);
  static final  Icon download = Icon(Icons.download,size: 25.sp,);
  static final  Icon uploadFile = Icon(Icons.upload_file,size: 25.sp,);
}