

import 'package:admin_panel/services/all_packages.dart';
import 'package:flutter/cupertino.dart';


class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController controllerEmail = TextEditingController();


  Future<void> pushAlert(BuildContext ctx) async {
    return showDialog(
      context: context,
      builder: (context) {
        if (Platform.isAndroid) {
          /// #addroid uchun
          return AlertDialog(
            title:  Text("Attention",textAlign: TextAlign.center,style: TextStyle(fontSize: 22.sp),),
            content:  Text("A message has been sent to your email",style: TextStyle(fontSize: 20.sp),),
            actions: [
              TextButton(
                onPressed: ()async{
                  String email = controllerEmail.text;
                  if(!Utils.regexEmail(email)){
                    KTScaffoldMessage.scaffoldMessage(context, KTStrings.somethingError);
                    return;
                  }else{
                    bool check = await AuthService.forgetPassword(email);
                    if(check){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInPage()),);
                    }
                  }
                },
                child: const Text("Ok"),
              ),
            ],
          );
        } else {
          /// #iPone uchun dialog
          return CupertinoAlertDialog(
            title:  Text("Attention",textAlign: TextAlign.center,style: TextStyle(fontSize: 22.sp),),
            content:  Text("A message has been sent to your email",style: TextStyle(fontSize: 20.sp),),
            actions: [
              CupertinoDialogAction(
                onPressed: ()async{
                  String email = controllerEmail.text;
                  if(!Utils.regexEmail(email)){
                    KTScaffoldMessage.scaffoldMessage(context, KTStrings.somethingError);
                    return;
                  }else{
                    bool check = await AuthService.forgetPassword(email);
                    if(check){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInPage()),);
                    }
                  }
                },
                child: const Text("Ok"),
              ),
            ],
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50.h),
        child: CustomAppBar(
          text: "Forget Password",
          fontSize: 25.sp,
          height: MediaQuery.sizeOf(context).height,
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: controllerEmail,
              hintText: "Email",
              maxLine: 1,
              onSubmitted: (text){
                if(!Utils.regexEmail(text)){
                  KTScaffoldMessage.scaffoldMessage(context, KTStrings.emailMessage);
                }
              },
              prefixIcon: const Icon(Icons.email),
            ),
            SizedBox(height: 20.h,),
            CustomButton(
              text: KTStrings.next,
              page:(){
                if(Utils.regexEmail(controllerEmail.text)){
                  pushAlert(context);
                }else{
                  KTScaffoldMessage.scaffoldMessage(context, KTStrings.emailMessage);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}