import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/module/view/test_player_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(centerTitle: true, color: Colors.white),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const TestPlayerScreen(),
    );
  }
}
