import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    splashFactory: InkRipple.splashFactory,
    primarySwatch: Colors.teal,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue[700],
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        )
      ),
    ),
  );
}
