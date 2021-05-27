import 'package:chat/Services/Database.dart';
import 'package:chat/Services/auth.dart';
import 'package:chat/helper/helperfunction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:chat/widgets/widget.dart';

import 'chatroomsscreen.dart';

class SignIn extends StatefulWidget {
  final Function toggle;
  SignIn(this.toggle);


  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final formKey = GlobalKey<FormState>();
  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController emailTextEditingController= new TextEditingController();
  TextEditingController passwordTextEditingController= new TextEditingController();

  bool isLoading=false;
  QuerySnapshot snapshotUserInfo;

  signIn(){
      if(formKey.currentState.validate()){
        HelperFunctions.saveUserEmailSharedPreference(emailTextEditingController.text);

       //TODO functiont to get userDetails

        setState(() {
          isLoading=true;
        });

        databaseMethods.getUserByUserEmail(emailTextEditingController.text)
        .then((val){
          snapshotUserInfo = val;
          HelperFunctions
              .saveUserNameSharedPreference(snapshotUserInfo.docs[0].get("name"));
        });

        authMethods.signInWithEmailAndPassword(emailTextEditingController.text, passwordTextEditingController.text)
        .then((val){
          if(val != null){


            HelperFunctions.saveUserLoggedInSharedPreference(true);
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => ChatRoom()
            ));

          }
        });

      }
  }

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
                   Form(
                     key:formKey,
                     child: Column(children: [
                       TextFormField
                         (validator: (val){
                            return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ?
                            null : "Enter correct email";
                            },
                           controller: emailTextEditingController,
                           style:simpleTextStyle(),
                           decoration:textfieldInputDecoration("email")
                       ),
                       TextField(

                           controller:passwordTextEditingController,
                           style:simpleTextStyle(),
                           decoration:textfieldInputDecoration("password")
                       ),
                     ],),
                   ),
                    SizedBox(height:8,),
                    Container(
                      alignment: Alignment.centerRight,
                      padding:EdgeInsets.symmetric(horizontal:16,vertical:8),
                      child:Text("Forgot Password",style:simpleTextStyle(),),
                    ),
                    SizedBox(height:8,),
                    GestureDetector(
                      onTap:(){
                        signIn();
                    },
                      child: Container(
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
                        GestureDetector(
                          onTap: (){
                            widget.toggle();
                          },
                          child: Container(
                            padding:EdgeInsets.symmetric(vertical:8),
                            child: Text("Register Now",style:TextStyle(
                                decoration:TextDecoration.underline,
                                  fontSize:17 ,
                                  color: Colors.white
                              ),
                            ),
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