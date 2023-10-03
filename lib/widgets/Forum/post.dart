import 'package:flutter/material.dart';

class PostWidget extends StatefulWidget {
  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: TextField(
            controller: _textEditingController,
            onChanged: (value) {
              setState(() {
                _postText = value;
              });
            },
            decoration: InputDecoration(
              hintText: "What's on your mind?",
            ),
          ),
        ),
        _imagePath.isNotEmpty
            ? Image.asset(
          _imagePath,
          width: 100,
          height: 100,
        )
            : SizedBox(),
        Stack(
          children: [
            Positioned(
              child:ElevatedButton(
                onPressed: _postText.isNotEmpty ? _post : null,
                style:ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xff212529)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              child: Text("Post"),
            ),)
          ],
        ),
      ],
    );
  }
}
