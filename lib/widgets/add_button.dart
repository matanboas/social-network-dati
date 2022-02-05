// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:hexcolor/hexcolor.dart';
import 'add_option_list.dart';
import '../utils/hero_dialog_route.dart';

class EmptyToList extends StatefulWidget {
  final void Function(dynamic) toContaxt;
  const EmptyToList({Key? key, required this.toContaxt}) : super(key: key);

  @override
  State<EmptyToList> createState() => _EmptyToListState();
}

class _EmptyToListState extends State<EmptyToList> {
  @override
  Widget build(BuildContext context) {
    widget.toContaxt(context);
    return Container();
  }
}

class AddButton extends StatefulWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  SMIBool? _pressed;
  dynamic _context;

  void _setContext(toContext) => {_context = toContext};

  void _changeToList(context) => {
        Navigator.of(context).push(HeroDialogRoute(builder: (context) {
          return Options(
            unPress: _unPress,
          );
        }))
      };

  void _onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(artboard, 'state');
    artboard.addController(controller!);
    _pressed = controller.findInput<bool>('on') as SMIBool;
  }

  void _unPress() => {_pressed?.change(!_pressed!.value)};

  void _onPress() =>
      {_pressed?.change(!_pressed!.value), _changeToList(_context)};

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: HexColor("#373640"),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
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
          child: Stack(children: [
            EmptyToList(toContaxt: _setContext),
            Center(
                child: SizedBox(
              width: 40,
              child: RiveAnimation.asset(
                'assets/animations/rotate-plus.riv',
                onInit: _onRiveInit,
                stateMachines: const ['state'],
              ),
            )),
          ]),
        ),
        color: Colors.transparent,
      ),
    );
  }
}
