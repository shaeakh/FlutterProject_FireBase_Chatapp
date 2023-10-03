import 'package:flutter/material.dart';

class Blank extends StatefulWidget {
  @override
  _Blank createState() => _Blank();
}

class _Blank extends State<Blank> {
  TextEditingController _textEditingController = TextEditingController();
  String _postText = "";
  String _imagePath = "";

  void _post() {
    // You can implement the logic to post the text and image here.
    // For this example, we'll just print the text and image path.
    print("Text: $_postText");
    print("Image Path: $_imagePath");
  }

  void _selectImage() {
    // Implement logic to select an image from the device's gallery or camera.
    // For simplicity, we'll just set a placeholder image path.
    setState(() {
      _imagePath = "path_to_selected_image.jpg";
    });
  }

  @override
  Widget build(BuildContext context) {
    final ScreenHeight = MediaQuery.of(context).size.height;
    final ScreenWeidth = MediaQuery.of(context).size.width;
    return Container(
      width: ScreenWeidth, // Set the desired width
      height: 5,
      alignment: Alignment.center,// Set the desired height
      decoration: BoxDecoration(
        color: Colors.transparent, // Set the background color
        borderRadius: BorderRadius.circular(20), // Set the border radius
      ),
    );
  }
}
