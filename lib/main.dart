import 'package:flutter/material.dart';
import 'package:flutter_playground/widgets/nav-bars/bottom_navbar.dart';
import 'package:flutter_playground/widgets/nav-bars/side_navbar.dart';

void main() {
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
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [SideNavbar()],
    );
  }
}
