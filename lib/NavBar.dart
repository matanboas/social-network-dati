// ignore_for_file: prefer_const_constructors
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';

class AddButton extends StatefulWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  SMITrigger? _pressed;

  void _onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);
    _pressed = controller.findInput<bool>('tap') as SMITrigger;
  }

  void _onPress() => _pressed?.fire();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: HexColor("#7C83FD"),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 12,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Material(
        child: InkWell(
          onTap: () {
            _onPress();
          },
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
              child: RiveAnimation.asset(
            'assets/rotate.riv',
            onInit: _onRiveInit,
          )),
        ),
        color: Colors.transparent,
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
  List<bool> enabledList = [true, false, false, false];

  void _changeActive(int selected) => {
        for (int i = 0; i < enabledList.length; i++)
          {
            i != selected
                ? {enabledList[i] = false, print("false")}
                : {enabledList[i] = true, print("true")}
          }
      };

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: InkWell(
                        onTap: () {
                          _changeActive(0);
                          setState(() {});
                        },
                        child: SvgPicture.asset(
                          'assets/homeIcon.svg',
                          semanticsLabel: 'Home logo',
                          color: enabledList[0]
                              ? HexColor('#200E32')
                              : HexColor('#A5A5A5'),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: InkWell(
                        onTap: () {
                          _changeActive(1);
                          setState(() {});
                        },
                        child: SvgPicture.asset(
                          'assets/notfIcon.svg',
                          semanticsLabel: 'Notafication logo',
                          color: enabledList[1]
                              ? HexColor('#200E32')
                              : HexColor('#A5A5A5'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: InkWell(
                        onTap: () {
                          _changeActive(2);
                          setState(() {});
                        },
                        child: SvgPicture.asset(
                          'assets/textIcon.svg',
                          semanticsLabel: 'Text logo',
                          color: enabledList[2]
                              ? HexColor('#200E32')
                              : HexColor('#A5A5A5'),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: InkWell(
                        onTap: () {
                          _changeActive(3);
                          setState(() {});
                        },
                        child: SvgPicture.asset(
                          'assets/accountIcon.svg',
                          semanticsLabel: 'Account logo',
                          color: enabledList[3]
                              ? HexColor('#200E32')
                              : HexColor('#A5A5A5'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
        ),
      ),
      Align(alignment: Alignment(0, 0.88), child: AddButton()),
    ]);
  }
}
