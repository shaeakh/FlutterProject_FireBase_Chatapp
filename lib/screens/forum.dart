import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Forum extends StatefulWidget{
  @override
  State<Forum>createState() => _Forum() ;
}

class _Forum extends State<Forum>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fire Alert Society",
      theme: ThemeData(fontFamily: "Space grotesk"),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 5,
      child :Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff212529),
          title: Text("Forum"),
          bottom: TabBar(
            tabs: [
              Tab(child: Icon(Icons.home)),
              Tab(child: Icon(Icons.people)),
              Tab(child: Icon(Icons.android_outlined)),
              Tab(child: Icon(Icons.home)),
            ],
          ),
        ),
      ),
      ),
    );
  }

}