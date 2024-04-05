import 'package:flutter/material.dart';
import 'package:flutter_playground/services/page_service.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({
    super.key,
    required this.pageController,
    required this.pageService,
  });

  final PageController pageController;
  final PageService pageService;

  List<BottomNavigationBarItem> get pages => const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), label: "Profile"),
      ];

  @override
  BottomNavbarState createState() => BottomNavbarState();
}

class BottomNavbarState extends State<BottomNavbar> {
  @override
  void initState() {
    super.initState();
    widget.pageController.addListener(_pageListener);
  }

  void _pageListener() {
    final int currentPage = widget.pageController.page!.round();
    if (currentPage != widget.pageService.pageIndex) {
      setState(() {
        widget.pageService.pageIndex = currentPage;
      });
    }
  }

  @override
  void dispose() {
    widget.pageController.removeListener(_pageListener);
    super.dispose();
  }

  void _onTap(int index) {
    widget.pageController.jumpToPage(index);
    widget.pageService.pageIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.pageService.pageIndex,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      onTap: _onTap,
      items: widget.pages,
    );
  }
}
