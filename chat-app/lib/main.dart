import 'package:chat/views/sign-up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chat/views/sign-in.dart';


void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Bro-Code',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor:Color(0xff145C9E),
        scaffoldBackgroundColor: Color(0x1f1F1F1F),
        primarySwatch: Colors.blue,
      ),
      home:SignUp(),
    );
  }
}

