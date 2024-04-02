import 'package:flutter/material.dart';
import 'package:flutter_playground/services/register_service.dart';

class SideNavbar extends StatefulWidget {
  const SideNavbar({super.key});

  @override
  SideNavbarState createState() => SideNavbarState();
}

class SideNavbarState extends State<SideNavbar> {
  final _pageController = singleton<PageController>();
  final _scaffoldKey = singleton<GlobalKey<ScaffoldState>>();

  void _toggleDrawer() {
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      Navigator.of(context).pop();
    } else {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Drawer(
        width: 100,
        backgroundColor: Colors.black,
        child: ListView(
          children: [
            IconButton(
              onPressed: () => _pageController.jumpToPage(0),
              icon: const Icon(Icons.camera_alt),
              iconSize: 60,
              color: Colors.white,
            ),
            IconButton(
                  onPressed: () => _pageController.jumpToPage(1),
                icon: const Icon(Icons.settings),
                iconSize: 60,
                color: Colors.white)
          ],
        ),
      ),
        IconButton(
          onPressed: _toggleDrawer,
          icon: const Icon(Icons.menu),
          alignment: Alignment.center,
          iconSize: 30,
          color: Colors.black,
        ),
      ],
    );
  }
}
