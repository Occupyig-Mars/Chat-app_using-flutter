import 'package:flutter/material.dart';

Widget appBarmain(BuildContext context){
    return AppBar(
      title:Image.asset("assets/img/logo.png", height:50,),
    );
}


InputDecoration textfieldInputDecoration(String hintText){
  return InputDecoration(
    hintText:hintText,
      hintStyle: TextStyle(
        color:Colors.white54
      ),
      focusedBorder:UnderlineInputBorder(
        borderSide:BorderSide(color:Colors.blue)
    ),
    enabledBorder:UnderlineInputBorder(
      borderSide:BorderSide(color:Colors.blue)
    )
  );
}

TextStyle simpleTextStyle(){
  return TextStyle(
    fontSize:16 ,
      color: Colors.white
  );
}
TextStyle mediumTextStyle(){
  return TextStyle(
      fontSize:17 ,
      color: Colors.white
  );
}