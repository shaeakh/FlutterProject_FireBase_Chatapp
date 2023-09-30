import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterproject_firebase_chatapp/widgets/chat/New_Msg.dart';
import 'package:flutterproject_firebase_chatapp/widgets/chat/messeges.dart';

class ChatScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
      return Scaffold(
         body : Container(
           child: Column(
             children: <Widget>[
               Expanded(
                   child: Messeges()
               ),
               New_Msg(),
             ],
           ),
         ),
    );
  }
}