import 'package:flutter/material.dart';

class CustomTheme {
  final ThemeData data;

  const CustomTheme({required this.data});

  Color get primaryAccent => CustomPalette.primaryAccent;

  static CustomTheme of(BuildContext context) {
    return CustomTheme(data: Theme.of(context));
  }

  static final ThemeData themeData = ThemeData(
    useMaterial3: true,
    //   !!! Example of how to utilize the themeData !!!
    // textTheme: const TextTheme(
    //   displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    //   displayMedium: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    //   displaySmall: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    // ),
    //fontFamily: 'my font'
  );
}

final CustomTheme customTheme = CustomTheme(data: CustomTheme.themeData);

abstract class CustomPalette {
  static const Color primaryAccent = Color(0xFFFF6D4D);
}
