import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject_firebase_chatapp/firebase_options.dart';
import 'package:flutterproject_firebase_chatapp/screens/auth_screen.dart';
import 'package:flutterproject_firebase_chatapp/screens/chat_screen.dart';
import 'package:flutterproject_firebase_chatapp/screens/alert.dart';
import 'package:flutter/material.dart';

ElevatedButton(
onPressed: () {
// Your onPressed logic here
},
  child: Row(
      mainAxisSize: MainAxisSize.min,
        children: [
            Icon(
              Icons.android, // Replace with your AI icon
              color: Colors.white, // Icon color
              ),
              SizedBox(width: 8), // Add some space between the icon and text
              Text(
              'AI',
              style: TextStyle(
              color: Colors.white, // Text color
              fontSize: 16, // Text size
              ),
            ),
          ],
),
)
