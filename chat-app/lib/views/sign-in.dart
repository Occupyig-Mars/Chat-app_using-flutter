import 'package:flutter/material.dart';
import 'package:chat/widgets/widget.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:appBarmain(context),
          body:SingleChildScrollView(
            child: Container(
              height:MediaQuery.of(context).size.height-50,
              alignment:Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal:24),
                child: Column(
                  mainAxisSize:MainAxisSize.min,
                  children:[
                    TextField(
                      style:simpleTextStyle(),
                      decoration:textfieldInputDecoration("email")
                      ),
                    TextField(
                      style:simpleTextStyle(),
                      decoration:textfieldInputDecoration("password")
                    ),
                    SizedBox(height:8,),
                    Container(
                      alignment: Alignment.centerRight,
                      padding:EdgeInsets.symmetric(horizontal:16,vertical:8),
                      child:Text("Forgot Password",style:simpleTextStyle(),),
                    ),
                    SizedBox(height:8,),
                    Container(
                      alignment:Alignment.center,
                      width :MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical:20),
                      decoration:BoxDecoration(
                        gradient:LinearGradient(
                          colors:[
                            const Color(0xff1bd2c0),
                            const Color(0xff2A75cB)
                          ]
                        ),
                      borderRadius:BorderRadius.circular(50)
                      ),
                      child:Text("Sign-In",style:TextStyle(
                        fontSize:17 ,
                        color: Colors.white,
                        )
                      )
                    ),
                    SizedBox(height:16,),
                    Container(
                        alignment:Alignment.center,
                        width :MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(vertical:20),
                        decoration:BoxDecoration(
                            color:Colors.white,
                            borderRadius:BorderRadius.circular(50)
                        ),
                        child:Text("Sign-In with google",style:TextStyle(
                          fontSize:17 ,
                          color: Colors.black,
                        )
                        )
                    ),
                    SizedBox(height:16,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?",style:mediumTextStyle(),),
                        Text("Register Now",style:TextStyle(
                            decoration:TextDecoration.underline,
                              fontSize:17 ,
                              color: Colors.white
                          ),
                        ),
                      ]
                    ),
                    SizedBox(height:50,),
                  ]
                ),
              ),
            ),
          )
    );
  }
}