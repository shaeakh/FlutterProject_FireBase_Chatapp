import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Status extends StatelessWidget{
  Status(this.text,this.imageUrl,this.Lat,this.Long,this.time);
  final String text;
  final String imageUrl;
  final String Lat;
  final String Long;
  final Timestamp time;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.indigoAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      width: 10,
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ),
      margin:  EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,

      ),
      child: Text(
        text,
        style:  TextStyle(color: Colors.white),

      ),
    );
  }


}