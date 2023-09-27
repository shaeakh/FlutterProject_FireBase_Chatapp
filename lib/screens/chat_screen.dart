import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
      return Scaffold(
         body : StreamBuilder(
           stream: FirebaseFirestore.instance
             .collection('/chats/iieHhDuNLGWgmF0Ea10L/messeges')
             .snapshots(),
           builder: (ctx,streamSnapshot){
             if(streamSnapshot.connectionState==ConnectionState.waiting){
               return Center(
                 child: CircularProgressIndicator(),
               );
             }
              return ListView.builder(
                 itemCount: streamSnapshot.data?.docs.length,
                 itemBuilder: (ctx,index) => Container(
                    padding: EdgeInsets.all(4),
                    child: Text(streamSnapshot.data?.docs[index]['text']),
                 ),
           );
         },
       ),


        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){},
        ),
    );
  }
}