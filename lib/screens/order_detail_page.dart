
import 'package:admin_panel/services/all_packages.dart';


class OrderDetailPage extends StatelessWidget {
  final OrderModel order;
  const OrderDetailPage({
    super.key,
    required this.order,
  });

  static PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50.h),
        child: CustomAppBar(
          text: order.name,
          fontSize: 25,
          height: MediaQuery.sizeOf(context).height,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
        children: [
          for(var item in order.products)
            CustomListTile(
              data: item.products,
              trailing: Text(item.quantity.toString(),style: TextStyle(fontSize: 20.sp),),
            ),
          SizedBox(height: 20.h,),
          /// #name
          Row(
            children: [
              KTIcons.personOrder,
              CustomTextWidget(
                text: "  ${order.name}",
                fontSize: 20.sp,
              ),

            ],
          ),
          SizedBox(height: 5.h,),
          /// #phone
          Row(
            children: [
              KTIcons.phone,
              CustomTextWidget(
                text: "  ${order.phone}",
                fontSize: 20.sp,
              ),
            ],
          ),
          SizedBox(height: 5.h,),
          /// #date
          Row(
            children: [
              KTIcons.calendar,
              CustomTextWidget(
                text: "  ${order.deta}",
                fontSize: 20.sp,
              ),
            ],
          ),
          SizedBox(height: 5.h,),
          /// #time
          Row(
            children: [
              KTIcons.time,
              CustomTextWidget(
                text: "  ${order.time}",
                fontSize: 20.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
