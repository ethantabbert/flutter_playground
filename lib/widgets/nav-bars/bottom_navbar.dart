import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  BottomNavbarState createState() => BottomNavbarState();
}

class BottomNavbarState extends State<BottomNavbar>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  bool isExtended = false;
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation = Tween<double>(begin: 1.0, end: 0.0).animate(controller);
  }

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleBar() {
    setState(() {
      isExtended = !isExtended;
    });
    if (isExtended) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        bottomNavigationBar: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () => _toggleBar(),
              icon: AnimatedIcon(
                icon: AnimatedIcons.close_menu,
                progress: animation,
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: isExtended ? (screenHeight / 8) : 0,
              alignment: Alignment.center,
              child: BottomAppBar(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.home),
                      onPressed: () => _onTap(0),
                      color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
                    ),
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () => _onTap(1),
                      color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications),
                      onPressed: () => _onTap(2),
                      color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
                    ),
                    IconButton(
                      icon: const Icon(Icons.account_circle),
                      onPressed: () => _onTap(3),
                      color: _selectedIndex == 3 ? Colors.blue : Colors.grey,
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
