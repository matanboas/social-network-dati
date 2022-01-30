// ignore_for_file: prefer_const_constructors
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'NavBar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Social",
      home: Scaffold(
        backgroundColor: HexColor("#DCDCDC"),
        body: Stack(
          children: const [
            NavBar(),
          ],
        ),
      ),
    );
  }
}
