import 'package:admin_panel/services/all_packages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerParol = TextEditingController();
  bool visibility = false;

  void signIn()async{
    String email = controllerEmail.text;
    String password = controllerParol.text;
    if(email.isEmpty || password.isEmpty){
      KTScaffoldMessage.scaffoldMessage(context, KTStrings.notLogin);
      return;
    }
    bool checkData = await AuthService.signIn(email, password);
    if(checkData){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgetPassword()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50.h),
        child: CustomAppBar(
          text: KTStrings.signIn,
          fontSize: 25,
          height: MediaQuery.sizeOf(context).height,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20.h,),
              CustomTextField(
                controller: controllerEmail,
                maxLine: 1,
                onSubmitted: (text){
                  if(!Utils.regexEmail(text)){
                    controllerEmail.text = "";
                  }
                },
                hintText: "Email",
                prefixIcon: KTIcons.email,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: controllerParol,
                obscureText: visibility,
                maxLine: 1,
                hintText: "Login",
                onSubmitted: (text){
                  if(!Utils.regexPassword(text)){
                    controllerParol.text = "";
                  }
                },
                prefixIcon: KTIcons.lock,
                suffix: IconButton(
                  onPressed: (){
                    visibility = !visibility;
                    setState(() {});
                  },
                  icon: visibility? KTIcons.visibilityOff :  KTIcons.visibility,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgetPassword()));
                      setState(() {});
                    },
                  child: const KTForgotTextWidget(),
                ),
              ),
              SizedBox(height: 20.h,),
              CustomButton(
                text: KTStrings.next,
                page: signIn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
