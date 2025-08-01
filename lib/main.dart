import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter_firebase/responsive/layout_screen.dart';
import 'package:instagram_clone_flutter_firebase/responsive/mobile_screen_layout.dart';
import 'package:instagram_clone_flutter_firebase/responsive/web_screen_layout.dart';
import 'package:instagram_clone_flutter_firebase/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      home: const ResponsiveLayout(
        webScreenLayout: WebScreenLayout(),
        mobileScreenLayout: MobileScreenLayout(),
      ),
    );
  }
}
