import 'package:colorpickerapp/pages/Color_picker.dart';
import 'package:colorpickerapp/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,

      home: ColorPickerPage(),
    );
  }
}
