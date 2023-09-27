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
             final d = streamSnapshot.data;
              return ListView.builder(
                 itemCount: d?.docs.length,
                 itemBuilder: (ctx,index) => Container(
                    padding: EdgeInsets.all(4),
                    child: Text(d?.docs[index]['text']),
                 ),
           );
         },
       ),


        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            FirebaseFirestore.instance
                .collection('/chats/iieHhDuNLGWgmF0Ea10L/messeges')
                .add({'text':'This was added by clicking the button'});
          },
        ),
    );
  }
}