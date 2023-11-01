


import 'package:admin_panel/services/all_packages.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<void>pushAlert(BuildContext context,String id,String imagePath)async{
    return showDialog(
        context: context,
        builder: (BuildContext context){
          if(Platform.isAndroid){
            /// addroid uchun
            return AlertDialog(
              title: const Text("Attention"),
              content: const Text("Do you really want to delate"),
              actions: [
                TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: const Text("No"),
                ),
                TextButton(
                  onPressed: ()async{
                    await DBService.deleteProduct(id,imagePath);
                    setState(() {});
                    Navigator.pop(context);
                  },
                  child: const Text("Yes"),
                ),
              ],
            );
          }else {
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
                  onPressed: ()async{
                    await DBService.deleteProduct(id,imagePath);
                    setState(() {});
                    Navigator.pop(context);
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
    return FutureBuilder<List<MenuModel>>(
      future: DBService.getAllMenu(),
      initialData: [],
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return  Center(child: CustomTextWidget(text: "No Data",fontSize: 25.sp,));
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator.adaptive());
          done:
          case ConnectionState.done:
            if (snapshot.hasData) {
              final item = snapshot.data;
              return Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size(double.infinity, 50.h),
                  child: CustomAppBar(
                    text: "Home Page",
                    fontSize: 25.sp,
                    height: MediaQuery.sizeOf(context).height,
                  ),
                ),
                body: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
                  itemCount: item?.length,
                  itemBuilder: (context, i) {
                    final data = item![i];
                    return CustomListTile(
                        data: data,
                        trailing: IconButton(
                          onPressed: () => pushAlert(context,data.id,data.imageUrl),
                          icon: KTIcons.delete,
                        )
                    );
                  },
                ),
              );
            } else {
              return  Center(child: CustomTextWidget(text: "No Data",fontSize: 25.sp,));
            }
          case ConnectionState.active:
            continue done;
        }
      },
    );
  }
}



