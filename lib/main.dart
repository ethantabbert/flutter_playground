import 'package:flutter/material.dart';
import 'package:flutter_playground/services/page_service.dart';
import 'package:flutter_playground/services/register_service.dart';
import 'package:flutter_playground/widgets/nav-bars/side_navbar.dart';

void main() {
  registerServices();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainView(),
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  MainViewState createState() => MainViewState();
}

class MainViewState extends State<MainView> {
  final _pageController = singleton<PageController>();
  final _page = PageService();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PageView(
          controller: _pageController,
          allowImplicitScrolling: false,
          physics: const NeverScrollableScrollPhysics(),
          children: [_page.testPage1, _page.testPage2],
        ),
        const SideNavbar()
      ],
    );
  }
}
