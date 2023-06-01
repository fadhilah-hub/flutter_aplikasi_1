import 'package:flutter/material.dart';
import 'package:flutter2/presentation/screen/book_screen/page/book_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: BookPage(),
      );
  }
}
