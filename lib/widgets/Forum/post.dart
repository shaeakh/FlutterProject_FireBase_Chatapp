import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:geolocator/geolocator.dart';

class PostWidget extends StatefulWidget{
  @override
  _PostWidget createState() => _PostWidget() ;
}

class _PostWidget extends State<PostWidget>{
  String _imgUrl = '';
  final _controller = new TextEditingController();
  var _enteredMsg = '';
  bool img_click = false;
  var Timee = DateTime.now();
  Future<void> _sendMsg(String imgUrl,var _enteredMsg) async {
      Position position = await getLoc();
      FocusScope.of(context).unfocus();
      FirebaseFirestore.instance.collection('chat').add({
        'text' : _enteredMsg,
        'time' : Timestamp.now(),
        'image': imgUrl,
        'Lat' : position.latitude,
        'Long': position.longitude,
        'year': Timee.year,
        'month': Timee.month,
        'day': Timee.day,
        'hour': Timee.hour,
        'min': Timee.minute,
      });

      _controller.clear();
  }
  Future<Position> getLoc() async{
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(child:  TextField(
            controller: _controller,
            decoration: InputDecoration(
                filled: false,
                fillColor: Colors.transparent,
                hintText: 'Alert People',
                contentPadding: EdgeInsets.all(16.0),
              ),
              style: TextStyle(
                color: Color(0xff212529),
                fontFamily: 'Space grotesk',
              ),
                    onChanged: (value){
                      setState(() {

                        _enteredMsg = value;
                      });
                    },
                  ),
                  ),

          IconButton(
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
              await reftoimgUpload.putFile(File(file.path));
              _imgUrl = await reftoimgUpload.getDownloadURL();
            },
          ),
          IconButton(
              color: Color(0xff212529),
              icon: Icon(Icons.send),
              onPressed: (){
                _sendMsg(_imgUrl,_enteredMsg);
                _imgUrl='';
              }
          )
        ],
      ),
    );//
  }

}