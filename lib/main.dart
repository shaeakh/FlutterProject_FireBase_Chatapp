import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject_firebase_chatapp/firebase_options.dart';
import 'package:flutterproject_firebase_chatapp/screens/auth_screen.dart';
import 'package:flutterproject_firebase_chatapp/screens/chat_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application., ;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat',

      theme: ThemeData(
        primarySwatch: Colors.pink,
        backgroundColor: Colors.pink,
        //colorScheme: ColorScheme.dark(), // this is dark mood
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.pink,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
          )
        )
      ),
      home: ChatScreen(),
      //home:  splashScreen(),
      //home: AuthScreen(),
    );
  }
}
