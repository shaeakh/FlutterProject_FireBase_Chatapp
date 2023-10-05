import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject_firebase_chatapp/widgets/chat/msg_bbl.dart';
import 'package:flutterproject_firebase_chatapp/widgets/Forum/Status.dart';

class Timeline extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('chat').orderBy(
            'time',
        ).snapshots(),
        builder: (ctx, chatSnapshot){
          if(chatSnapshot.connectionState==ConnectionState.waiting){
            return Center( child: CircularProgressIndicator(), );
          }
          final chatDocs = chatSnapshot.data?.docs;
          return ListView.builder(
            reverse: true,
            itemCount: chatSnapshot.data?.docs.length,
            itemBuilder: (ctx,index) => Status(
              chatDocs?[index]['text'],
              chatDocs?[index]['image'],
              chatDocs?[index]['Lat'],
              chatDocs?[index]['Long'],
              chatDocs?[index]['time'],
              chatDocs?[index]['year'],
              chatDocs?[index]['month'],
              chatDocs?[index]['day'],
              chatDocs?[index]['hour'],
              chatDocs?[index]['min'],

            ),
          );
        }
    );
  }
}