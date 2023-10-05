
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Status extends StatelessWidget{
  Status(this.text,this.imageUrl,this.Lat,this.Long,this.time,this.year, this.month, this.day, this.hour, this.min);
  final String text;
  final String imageUrl;
  final double Lat;
  final double Long;
  final Timestamp time;
  final int year ;
  final int month ;
  final int day ;
  final int hour ;
  final int min ;
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
      child: Column(
        children: [
          //time
          Text( '${hour}'+':'+'${min}'+' '+'${day}'+'/'+'${month}'+'/'+'${year}',
            style:  TextStyle(color: Colors.grey),
          ),
          Text( text,
            style:  TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }


}