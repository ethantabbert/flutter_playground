import 'package:flutter/material.dart';
import 'package:flutter_playground/services/page_service.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView(
      {super.key, required this.pageController, required this.pageService});

  final PageController pageController;
  final PageService pageService;

  @override
  CustomPageViewState createState() => CustomPageViewState();
}

class CustomPageViewState extends State<CustomPageView> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: widget.pageController,
      allowImplicitScrolling: false,
      physics: const NeverScrollableScrollPhysics(),
      children: widget.pageService.pages,
    );
  }
}
