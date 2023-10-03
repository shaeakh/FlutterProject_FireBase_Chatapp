import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
    final ScreenHeight = MediaQuery.of(context).size.height;
    final ScreenWeidth = MediaQuery.of(context).size.width;
    String imgurl = "";
    return Container(
      width: ScreenWeidth-20, // Set the desired width
      height: 100,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,// Set the desired height
            decoration: BoxDecoration(
              color: Colors.transparent, // Set the background color to transparent
              borderRadius: BorderRadius.circular(20), // Set the border radius
              border: Border.all(
                color: Color(0xff212529), // Set the border color
                width: 2.5, // Set the border width
              ),
            ),
          ),
          Center(
            child: TextField(
              decoration: InputDecoration(
                filled: false,
                fillColor: Colors.transparent,
                hintText: 'Alert People',
                contentPadding: EdgeInsets.all(16.0),
              ),
              style: TextStyle(
                color: Color(0xff212529),
              ),
            ),
          ),
          Positioned(
            top:50,
              right: 10,
              child: ElevatedButton(
                onPressed: (){},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                child: Text('Post', style: TextStyle(color: Color(0xffffffff))),
              ),
          ),
          Positioned(
            top:50,
            right: 70,
            child:Container(
              child: IconButton(
                color: Color(0xff212529),

                icon: Icon(Icons.image),
                onPressed: () async {
                  String filename = DateTime.now().microsecondsSinceEpoch.toString();

                  ImagePicker img_pik = ImagePicker();
                  XFile? file = await img_pik.pickImage(source: ImageSource.camera);
                  print('${file?.path}');
                  if(file == null) return;
                  Reference referenceRoot = FirebaseStorage.instance.ref();
                  Reference refDirImgs=referenceRoot.child('images');

                  Reference reftoimgUpload = refDirImgs.child(filename);
                  try{
                    await reftoimgUpload.putFile(File(file!.path));
                    imgurl = await reftoimgUpload.getDownloadURL();

                  }catch(error){

                  }

                },
              ),
            ),
          ),
        ],
      ),

    );
  }
}
