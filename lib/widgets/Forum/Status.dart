
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
    final ScreenWeidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(12),
      ),
      width: 10,
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ),
      margin:  EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 25,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  child: Image.asset('assets/user.png'),
                  height: 45,
                  width: 45,
                ),
                Text( 'sas',
                  style: TextStyle(
                    color: Colors.transparent,
                    fontSize: 5,
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text( 'Latitude : '+Lat.toString()+'\nLongitude : '+Long.toString(),
                        style: TextStyle(
                          color: Color(0xff212529),
                          fontSize: 15, // Adjust this value to change the font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //time
                      Text( '${hour%12}'+':'+'${min}'+' '+'${day}'+'/'+'${month}'+'/'+'${year}',
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 13, // Adjust this value to change the font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Text( 's',
            style: TextStyle(
              color: Colors.transparent,
              fontSize: 5, // Adjust this value to change the font size
            ),
          ),
          Text( text,
            style: TextStyle(
              color: Color(0xff212529),
              fontSize: 14, // Adjust this value to change the font size
            ),
          ),
          Text( 's',
            style: TextStyle(
              color: Colors.transparent,
              fontSize: 5, // Adjust this value to change the font size
            ),
          ),
          SizedBox(
            height: 300,
            width: 300,
            child: Image(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          Text( 's',
            style: TextStyle(
              color: Colors.transparent,
              fontSize: 10, // Adjust this value to change the font size
            ),
          ),
          Container(
          width: ScreenWeidth, // Set the desired width
          height: 5,
          alignment: Alignment.center,// Set the desired height
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
                colors: [
                  Colors.transparent,
                  Color(0xff212529),
                  Colors.transparent,
                ],
              ),
          // Set the background color
          borderRadius: BorderRadius.circular(50), // Set the border radius
          ),
          ),
        ],
      ),
    );
  }
}