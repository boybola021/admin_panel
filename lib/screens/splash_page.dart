import '../services/images.dart';
import 'package:admin_panel/services/all_packages.dart';



class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    goToNextPage();
  }

  void goToNextPage() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const SignInPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: KTImages.backgroundImg,
            fit: BoxFit.fitHeight,
          ),
        ),
        child: KTImages.logo,
      ),
    );
  }
}

