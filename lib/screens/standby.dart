import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Standby extends StatefulWidget{
  const Standby({Key?key}) : super(key:key);
  @override
  State<Standby> createState() => _Standby();
}

class _Standby extends State<Standby>{


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GoogleMap(
          initialCameraPosition: CameraPosition(
              target: LatLng(38.882918, -77.016272),
              zoom: 11.0,
            tilt: 0.0,
          ),
        ),
    );
  }

}