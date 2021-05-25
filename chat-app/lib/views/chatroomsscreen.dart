import 'package:chat/Services/auth.dart';
import 'package:chat/helper/authentication.dart';
import 'package:chat/views/search.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key key}) : super(key: key);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {

  AuthMethods authMethods= new AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Image.asset("assets/img/mars-logo.jpg", height:50,),
      actions: [
        GestureDetector(
          onTap:(){
            authMethods.signOut();
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder:(context) =>Authenticate()
            ));
          },
          child: Container(
              padding:EdgeInsets.symmetric(horizontal:16),
              child: Icon(Icons.exit_to_app)),
        )
      ],
      ),
      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.search),
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(
            builder: (context) => SearchScreen()
          ));
        },
      ),
    );
  }
}
