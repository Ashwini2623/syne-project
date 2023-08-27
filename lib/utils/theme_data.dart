import 'package:flutter/material.dart';
import '../../../utils/constants.dart';

ThemeData theme = ThemeData(
    scaffoldBackgroundColor: kWhiteColor,
    appBarTheme: const AppBarTheme(backgroundColor: kWhiteColor, elevation: 0),
    elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
            visualDensity: VisualDensity(vertical: 2.0),
            backgroundColor: MaterialStatePropertyAll(kCardColor),
            shadowColor: MaterialStatePropertyAll(kGreyColor),
            overlayColor: MaterialStatePropertyAll(kCardColor))),
    textTheme: const TextTheme(
      labelLarge: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Jost'),
      bodyLarge: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Jost'),
      titleLarge: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Jost'),
      labelMedium: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'Jost'),
      bodyMedium: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w400, fontFamily: 'Jost'),
      titleMedium: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w400, fontFamily: 'Jost'),
      labelSmall: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w300, fontFamily: 'Jost'),
      bodySmall: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w300, fontFamily: 'Jost'),
      titleSmall: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w300, fontFamily: 'Jost'),
    ));
