import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NeonLights extends StatefulWidget {
  @override
  _NeonLightsState createState() => _NeonLightsState();
}

class _NeonLightsState extends State<NeonLights> {
  bool _isBlinking = false;

  @override
  void initState() {
    super.initState();

    // Toggle blinking every 500 milliseconds
    Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        _isBlinking = !_isBlinking;
      });
    });
  }

  void _handleCloseButton() {
    // Handle the close button press here
    // For example, you can close the outer circular-edged rectangle.
  }

  @override
  Widget build(BuildContext context) {
    String imgurl = '';
    final ScreenHeight = MediaQuery.of(context).size.height;
    final ScreenWeidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: AnimatedOpacity(
          opacity: _isBlinking ? 0.0 : 1.0,
          duration: Duration(milliseconds: 500),
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                height: 20, // Height of the top border
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.red,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                width: 20, // Width of the left border
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Colors.redAccent,
                        Colors.redAccent,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                right: 0,
                height: 20, // Height of the bottom border
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.red,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                width: 20, // Width of the right border
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.red,
                        Colors.red,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),

              Positioned( // outer alert box
                right: ScreenWeidth/2-100,
                top: ScreenHeight-(ScreenHeight-290),
                bottom: ScreenHeight-(ScreenHeight-290),
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    width: 200, // Adjust the width as needed
                    height: 150, // Adjust the height as needed
                    color: Colors.grey, // Set the background color as desired
                    child: Stack(
                      children: [
                        Positioned(
                          top: -7,
                          right: -5,
                          child: IconButton(
                            onPressed: _handleCloseButton,
                            icon: Icon(Icons.close),
                            color: Colors.white, // Set the icon color as desired
                          ),
                        ),
                        Center(
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25.0),
                                child: Container(
                                  width: 180, // Adjust the width as needed
                                  height: 150, // Adjust the height as needed
                                  color: Color(0xfffff9e1),
                                ),
                              ),
                              Positioned(
                                top: 90,
                                right: 17, // top -  width /2
                                width: 146,

                                child:ElevatedButton(
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
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7.0),
                                      ),
                                    ),
                                  ),
                                  child: Text('Fire !! Alert Others', style: TextStyle(color: Colors.white)),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 50,
                                width: 80,
                                child: Image.asset('assets/firehazard.png'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
