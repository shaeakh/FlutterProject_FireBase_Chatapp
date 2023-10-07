import 'package:flutter/material.dart';
import 'package:flutterproject_firebase_chatapp/widgets/auth/auth_form.dart';
import 'package:flutterproject_firebase_chatapp/widgets/SOS/Contacts.dart';

class SOSpage extends StatefulWidget {
  @override
  _SOSpage createState() => _SOSpage();
}

class _SOSpage extends State<SOSpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SOS-Contact List'),
        centerTitle: true,
        backgroundColor: Color(0xff212529),
      ),
      body: Scaffold(
        body: Column(
          children: [
            Contacts('Police','999'),
            Contacts('Ambulance','01704718964'),
            Contacts('FireService','16103'),
            //Contacts('Help Center','017******'),
            //Contacts('Animal Help','017******'),
            //Contacts('Doctor','017******'),
          ],
        ),
      ),
    );
  }
}