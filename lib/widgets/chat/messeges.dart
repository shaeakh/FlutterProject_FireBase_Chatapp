import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Messeges extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('chat').snapshots(),
        builder: (ctx, chatSnapshot){
          if(chatSnapshot.connectionState==ConnectionState.waiting){
            return Center( child: CircularProgressIndicator(), );
          }
          final chatDocs = chatSnapshot.data?.docs;
          return ListView.builder(
              itemCount: chatSnapshot.data?.docs.length,
              itemBuilder: (ctx,index) => Text(
                  chatDocs?[index]['text']),
          );
        }
    );
  }
}