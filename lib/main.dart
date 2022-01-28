// ignore_for_file: prefer_const_constructors
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      home: Login(),
    );
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#DCDCDC"),
      body: Stack(
        children: [
          Align(alignment: Alignment.bottomCenter, child: NavBar()),
          Align(
            alignment: Alignment(0, 0.9),
            child: Container(
              width: 60,
              height: 60,
              child: Center(
                  child: SvgPicture.asset("../images/plus-button.svg",
                      semanticsLabel: 'plus')),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: HexColor("#7C83FD"),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 12,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 7,
            blurRadius: 12,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
    );
  }
}
