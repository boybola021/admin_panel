import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../model/menu_model.dart';
import '../screens/detail_page.dart';

class CustomListTile extends StatelessWidget {
  final MenuModel data;
  final Widget trailing;

  const CustomListTile({super.key, required this.data, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                product: data,
              ),
            ),
          );
        },
        leading: Container(
          height: 90.h,
          width: 80.w,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12.r),
            ),
          ),
          child: Image.network(
            data.imageUrl,
            fit: BoxFit.fill,
            errorBuilder: (context, child, StackTrace? stackTress) {
              return const Icon(Icons.error);
            },
          ),
        ),
        title: Text(
          data.name,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 20.sp),
        ),
        subtitle: Text("${data.price} \$", style: TextStyle(fontSize: 17.sp)),
        trailing: trailing,
      ),
    );
  }
}
