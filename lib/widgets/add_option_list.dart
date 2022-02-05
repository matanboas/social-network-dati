import 'package:flutter/material.dart';

class Options extends StatefulWidget {
  final void Function() unPress;
  const Options({Key? key, required this.unPress}) : super(key: key);

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Align(
        alignment: Alignment(0, 0.6),
        child: Container(
          width: 130,
          height: 150,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget.unPress();
    super.dispose();
  }
}
