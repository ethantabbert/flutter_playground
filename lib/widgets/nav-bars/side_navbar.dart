import 'package:flutter/material.dart';

class SideNavbar extends StatefulWidget {
  const SideNavbar({super.key});

  @override
  SideNavbarState createState() => SideNavbarState();
}

class SideNavbarState extends State<SideNavbar> {
  final PageController _pageController = PageController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _toggleDrawer() {
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      Navigator.of(context).pop();
    } else {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // floatingActionButton: IconButton(
      //   onPressed: () => _toggleDrawer(),
      //   icon: const Icon(Icons.menu),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer: Drawer(
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
                onPressed: () => _pageController.jumpToPage(0),
                icon: const Icon(Icons.settings),
                iconSize: 60,
                color: Colors.white)
          ],
        ),
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: <Widget>[
              Container(
                  color: Colors.green,
                  child: const Center(child: Text('Page 1'))),
              Container(
                  color: Colors.red,
                  child: const Center(child: Text('Page 2'))),
              Container(
                  color: Colors.blue,
                  child: const Center(child: Text('Page 3'))),
            ],
          ),
          Positioned(
            top: (MediaQuery.of(context).size.height / 2) - 30,
            child: IconButton(
              onPressed: _toggleDrawer,
              icon: const Icon(Icons.menu),
              alignment: Alignment.center,
              iconSize: 30,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
