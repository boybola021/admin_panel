import 'package:admin_panel/services/all_packages.dart';

class DetailPage extends StatelessWidget {
  final MenuModel product;
  const DetailPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50.h),
        child: CustomAppBar(
          text: product.name,
          fontSize: 25,
          height: MediaQuery.sizeOf(context).height,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 10),
        children: [
          product.imageUrl.isNotEmpty ?
          SizedBox(
            height: 210.h,
            child: Image.network(product.imageUrl,fit: BoxFit.contain,),
          ):
          const Center(child: CircularProgressIndicator.adaptive(),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// #name
                RichTextDetailPage(name: KTStrings.name, desc: product.name),
                SizedBox(
                  height: 10.h,
                ),

                /// #description
                RichTextDetailPage(
                    name: KTStrings.desc, desc: product.description),
                SizedBox(
                  height: 10.h,
                ),

                /// #category
                RichTextDetailPage(
                    name: KTStrings.category, desc: product.category),
                SizedBox(
                  height: 10.h,
                ),

                /// #price
                RichTextDetailPage(
                    name: KTStrings.price, desc: "${product.price} \$"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
