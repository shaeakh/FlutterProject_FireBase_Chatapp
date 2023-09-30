

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Alert extends StatefulWidget{
  @override
  State<Alert>createState() => _Alert() ;
}

class _Alert extends State<Alert>{
  bool _show = true;
  Timer ?_timer;
  @override
  void initState(){
    _timer = Timer.periodic(const Duration(milliseconds: 500), (_) {
      setState(() => _show = !_show );
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context){

    return Scaffold(
        body : AnimatedOpacity(
          opacity: _show ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          child: Center(
            child: Image.asset('assets/Blink_alert.png'),
          ),
        ),
    );
  }
}
