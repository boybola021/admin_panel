import 'firebase_options.dart';
import 'package:admin_panel/services/all_packages.dart';

void main()async{

  WidgetsFlutterBinding.ensureInitialized();

  /// #responsive package
  await ScreenUtil.ensureScreenSize();

  /// #firebase

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const App());

}