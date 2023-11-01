


import 'package:admin_panel/services/all_packages.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.white.withOpacity(0.2),
      body: const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
