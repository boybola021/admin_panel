import 'package:admin_panel/services/all_packages.dart';
import 'package:uuid/uuid.dart';
import 'loading_page.dart';


class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerDescription = TextEditingController();
  final TextEditingController controllerPrice = TextEditingController();
  final ImagePicker picker = ImagePicker();
  String categoryText = "";
  File? file;
  bool isLoading = false;

  void uploadData() async {
    String name = controllerName.text;
    String desc = controllerDescription.text;
    String price = controllerPrice.text;
    String category = categoryText;
    if (name.isEmpty || desc.isEmpty || price.isEmpty || category.isEmpty) {
      KTScaffoldMessage.scaffoldMessage(context, KTStrings.checkYourField);
      return;
    } else {
      setState(() => isLoading = true);
      final id = const Uuid().v4();
      final check = await DBService.uploadProduct(
        id, name, desc, category, double.parse(price), file!);
      if (check) {
        controllerName.text = "";
        controllerDescription.text = "";
        controllerPrice.text = "";
        categoryText = "";
        file = null;
        setState(() {});
        KTScaffoldMessage.scaffoldMessage(context, KTStrings.successfullyUpload);
      }
      setState(() => isLoading = false);
    }
  }

  void getImage() async {
    final xFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
    file = xFile != null ? File(xFile.path) : null;
    if (file != null&& mounted) {
      await StoreService.uploadFile(file!);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
        preferredSize: Size(double.infinity, 50.h),
        child: CustomAppBar(
          text: "Upload Page",
          fontSize: 25.sp,
          height: MediaQuery.sizeOf(context).height,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: uploadData,
        child: const Icon(Icons.upload),
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
            children: [
              GestureDetector(
                  onTap: getImage,
                  child: SizedBox(
                    height: 200.h,
                    child: file != null
                        ? SizedBox(
                            height: 180.h,
                            child: Image.file(file!),
                          )
                        : KTIcons.add,
                  ),
              ),
              SizedBox(height: 20.h,),
              ///#name
              CustomTextField(
                controller: controllerName,
                prefixIcon: KTIcons.rename,
                hintText: KTStrings.name,
                onSubmitted: (text){
                 if(!Utils.regexProductName(text)){
                   controllerName.text = "";
                   KTScaffoldMessage.scaffoldMessage(context, KTStrings.name);
                 }
                },
                maxLine: 1,
              ),
              SizedBox(
                height: 20.h,
              ),
              /// description
              CustomTextField(
                controller: controllerDescription,
                prefixIcon: KTIcons.description,
                hintText: KTStrings.desc,
                onSubmitted: (text){
                  if(!Utils.regexProductDesc(text)){
                    controllerDescription.text = "";
                    KTScaffoldMessage.scaffoldMessage(context, KTStrings.descriptionError);
                  }
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextField(
                keyboardType: TextInputType.number,
                controller: controllerPrice,
                prefixIcon: KTIcons.price,
                hintText: KTStrings.price,
              ),
              SizedBox(
                height: 20.h,
              ),
              PopupMenuButton<Widget>(
                itemBuilder: (context) {
                  return [
                    for (int i = 0; i < CategoryEnum.values.length; i++)
                      PopupMenuItem(
                        child: Text(
                          CategoryEnum.values[i].category,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 30),
                        ),
                        onTap: () {
                          categoryText = CategoryEnum.values[i].category;
                          setState(() {});
                        },
                      ),
                  ];
                },
                child: Container(
                  height: 50.h,
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: const Color.fromRGBO(80, 76, 85, 1),
                  ),
                  child: Row(
                    children: [
                      KTIcons.category,
                      SizedBox(width: 5.w,),
                      Text(
                        categoryText.isNotEmpty ? categoryText : KTStrings.category,
                        style: TextStyle(fontSize: 20.sp),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (isLoading) const LoadingPage(),
        ],
      ),
    );
  }
}
