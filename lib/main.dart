import 'package:flutter/material.dart';
import 'package:flutter_playground/services/page_service.dart';
import 'package:flutter_playground/services/register_service.dart';
import 'package:flutter_playground/widgets/nav-bar/bottom_navbar.dart';
import 'package:flutter_playground/widgets/page-view/page_view.dart';

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
  final _pageService = singleton<PageService>();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPageView(
          pageController: _pageController, pageService: _pageService),
      bottomNavigationBar: BottomNavbar(
        pageController: _pageController,
        pageService: _pageService,
      ),
    );
  }
}
