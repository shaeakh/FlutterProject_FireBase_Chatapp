import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
      return Scaffold(
         body : ListView.builder(
          itemCount: 10,
          itemBuilder: (ctx,index) => Container(
            padding: EdgeInsets.all(4),
            child: Text('thiss works'),
          ),
       ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            FirebaseFirestore.instance
                .collection('/chats/iieHhDuNLGWgmF0Ea10L/messeges')
                .snapshots()
          },
        )
    );
  }
}