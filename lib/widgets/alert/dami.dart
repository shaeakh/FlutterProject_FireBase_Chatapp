import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Circular-Edged Rectangle with TextField'),
        ),
        body: Center(
          child: CircularEdgedRectangleWithTextField(),
        ),
      ),
    );
  }
}

class CircularEdgedRectangleWithTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Adjust the width as needed
      height: 100, // Adjust the height as needed
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(50), // Make it circular-edged
            ),
          ),
          Center(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter Text',
                contentPadding: EdgeInsets.all(16.0),
              ),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
