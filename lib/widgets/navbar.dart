// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'add_button.dart';

class NavBar extends StatefulWidget {
  final void Function(int) changePage;
  const NavBar({Key? key, required this.changePage}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with TickerProviderStateMixin {
  List<bool> enabledList = [true, false, false, false];

  void _changeActive(int selected) => {
        setState(() {
          for (int i = 0; i < enabledList.length; i++) {
            i != selected ? {enabledList[i] = false} : {enabledList[i] = true};
            widget.changePage(selected);
          }
        })
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
                  Icon(
                    changeActive: _changeActive,
                    icon: 'assets/icons/homeIcon.svg',
                    iconNum: 0,
                    enabledList: enabledList,
                  ),
                  Icon(
                    changeActive: _changeActive,
                    icon: 'assets/icons/notfIcon.svg',
                    iconNum: 1,
                    enabledList: enabledList,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    changeActive: _changeActive,
                    icon: 'assets/icons/textIcon.svg',
                    iconNum: 2,
                    enabledList: enabledList,
                  ),
                  Icon(
                    changeActive: _changeActive,
                    icon: 'assets/icons/accountIcon.svg',
                    iconNum: 3,
                    enabledList: enabledList,
                  )
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: HexColor('7E97A6'),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 7,
                blurRadius: 12,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
        ),
      ),
      Align(alignment: Alignment(0, 0.88), child: AddButton())
    ]);
  }
}

class Icon extends StatefulWidget {
  final String icon;
  final int iconNum;
  final void Function(int) changeActive;
  final List<bool> enabledList;

  const Icon(
      {Key? key,
      required this.icon,
      required this.changeActive,
      required this.iconNum,
      required this.enabledList})
      : super(key: key);

  @override
  State<Icon> createState() => _IconState();
}

class _IconState extends State<Icon> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: InkWell(
          onTap: () {
            setState(() {
              widget.changeActive(widget.iconNum);
            });
          },
          child: SvgPicture.asset(
            widget.icon,
            semanticsLabel: 'navbar icon',
            color: widget.enabledList[widget.iconNum]
                ? HexColor('#373640')
                : HexColor('#373640').withOpacity(0.3),
          ),
        ),
      ),
    );
  }
}
