import 'package:flutter/cupertino.dart';
import 'package:admin_panel/services/all_packages.dart';
import 'order_detail_page.dart';


class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  Future<void> pushAlert(BuildContext context, String id) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          if (Platform.isAndroid) {
            /// addroid uchun
            return AlertDialog(
              title: const Text("Attention"),
              content: const Text("Do you really want to delate"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("No"),
                ),
                TextButton(
                  onPressed: () async {
                    bool check = await DBService.orderDelete(id);
                    debugPrint(check.toString());
                    Navigator.pop(context);
                    setState(() {});
                  },
                  child: const Text("Yes"),
                ),
              ],
            );
          } else {
            /// iPone uchuun dialog
            return CupertinoAlertDialog(
              title: const Text("Attention"),
              content: const Text("Do you really want to delate"),
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("No"),
                ),
                CupertinoDialogAction(
                  onPressed: () async {
                    await DBService.orderDelete(id);
                    Navigator.pop(context);
                    setState(() {});
                  },
                  child: const Text("Yes"),
                ),
              ],
            );
          }
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<OrderModel>>(
      future: DBService.getOrderUser(),
      initialData: [],
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Center(
              child: CustomTextWidget(
                text: "No Data",
                fontSize: 25.sp,
              ),
            );
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator.adaptive());
          done:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return Scaffold(
                appBar:  PreferredSize(
                  preferredSize: Size(double.infinity, 50.h),
                  child: CustomAppBar(
                    text: "Order Page",
                    fontSize: 25.sp,
                    height: MediaQuery.sizeOf(context).height,
                  ),
                ),
                body: RefreshIndicator(
                  onRefresh: ()async{
                    return Future<void>.delayed(const Duration(seconds: 3));
                  },
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 20.h),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, i) {
                      final data = snapshot.data![i];
                      return Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderDetailPage(
                                  order: data,
                                ),
                              ),
                            );
                          },
                          title: CustomTextWidget(
                            text: data.name,
                            fontSize: 20.sp,
                          ),
                          subtitle: Row(
                            children: [
                              CustomTextWidget(
                                text: data.deta.substring(0,10),
                                fontSize: 20.sp,
                              ),
                              SizedBox(width: 20.w,),
                              CustomTextWidget(
                                text: data.time,
                                fontSize: 20.sp,
                              ),
                            ],
                          ),
                          trailing: IconButton(

                            onPressed: (){
                              pushAlert(context, data.id);
                            },
                            icon: KTIcons.delete,
                          ),
                          //  subtitle: Text(pro.products.name),
                        ),
                      );
                    },
                  ),
                ),
              );
            } else if (!snapshot.hasData) {
              return Center(
                  child: CustomTextWidget(
                      text: "No Data", fontSize: 25.sp
                  ),
              );
            } else {
              return Center(
                child: CustomTextWidget(
                  text: KTStrings.checkYourInternet,
                  fontSize: 25.sp,
                ),
              );
            }
          case ConnectionState.active:
            continue done;
        }
      },
    );
  }
}

