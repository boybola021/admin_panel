
import 'home_page.dart';
import 'package:admin_panel/services/all_packages.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  late PageController controller;
  List<Widget> pages = const [
    HomePage(),
    OrderPage(),
    UploadPage(),
  ];

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedItemColor: KTColors.pink,
        unselectedItemColor: Colors.white,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          currentIndex = value;
          controller.jumpToPage(currentIndex);
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
              icon: KTIcons.home, label: KTStrings.home),
          BottomNavigationBarItem(
              icon: KTIcons.download, label: KTStrings.download),
          BottomNavigationBarItem(
              icon: KTIcons.uploadFile, label: KTStrings.uploadFile),
        ],
      ),
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(pages.length, (index) => pages[index]),
      ),
    );
  }
}
