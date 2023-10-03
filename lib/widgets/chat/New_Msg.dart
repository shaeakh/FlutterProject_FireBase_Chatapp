import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:geolocator/geolocator.dart';

class New_Msg extends StatefulWidget{
  @override
  _New_Msg createState() => _New_Msg() ;
}

class _New_Msg extends State<New_Msg>{
  String imgurl = '';
  final _controller = new TextEditingController();
  var _enteredMsg = '';
  bool img_click = false;
  Future<void> _sendMsg(String imgurl,var _enteredMsg) async {
    Position position = await getLoc();
    FocusScope.of(context).unfocus();
    FirebaseFirestore.instance.collection('chat').add({
      'text' : _enteredMsg,
      'time' : Timestamp.now(),
      'image': imgurl,
      'Lat' :'${position.latitude}',
      'Long': '${position.longitude}',
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
            decoration: InputDecoration(labelText: 'Send a Messege...'),
            onChanged: (value){
              setState(() {
                _enteredMsg = value;
              });
            },
          ),
          ),

          IconButton(
            color: Theme.of(context).primaryColor,
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
                imgurl = await reftoimgUpload.getDownloadURL();
            },
          ),
          IconButton(
            color: Colors.pink,
            icon: Icon(Icons.send),
            onPressed: (){
              _sendMsg(imgurl,_enteredMsg);
              imgurl = '';
            }
          )
        ],
      ),
    );//
  }

}