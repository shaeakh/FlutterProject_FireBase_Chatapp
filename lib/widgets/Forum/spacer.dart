import 'package:flutter/material.dart';

class Spacer extends StatefulWidget {
  @override
  _Spacer createState() => _Spacer();
}

class _Spacer extends State<Spacer> {
  TextEditingController _textEditingController = TextEditingController();
   @override
  Widget build(BuildContext context) {
    final ScreenHeight = MediaQuery.of(context).size.height;
    final ScreenWeidth = MediaQuery.of(context).size.width;
    return Container(
      width: ScreenWeidth, // Set the desired width
      height: 5,
      alignment: Alignment.center,// Set the desired height
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.red,
            Colors.transparent,
          ],
        ),
         // Set the background color
        borderRadius: BorderRadius.circular(20), // Set the border radius
      ),
    );
  }
}
