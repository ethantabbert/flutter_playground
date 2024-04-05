import "package:flutter/material.dart";
import "package:flutter_playground/pages/test-pages/test_page_1.dart";
import "package:flutter_playground/pages/test-pages/test_page_2.dart";
import "package:flutter_playground/pages/test-pages/test_page_3.dart";
import "package:flutter_playground/pages/test-pages/test_page_4.dart";

class PageService {
  late int pageIndex = 0;

  final TestPage1 testPage1 = const TestPage1();
  final TestPage2 testPage2 = const TestPage2();
  final TestPage3 testPage3 = const TestPage3();
  final TestPage4 testPage4 = const TestPage4();

  List<Widget> get pages => <Widget>[
        testPage1,
        testPage2,
        testPage3,
        testPage4,
      ];
}
