import 'package:chat/Services/auth.dart';
import 'package:chat/widgets/widget.dart';
import 'package:flutter/material.dart';

import 'chatroomsscreen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override

  bool isLoding=false;

  AuthMethods authMethods = new AuthMethods();
  final formKey = GlobalKey<FormState>();
  TextEditingController userNameTextEditingController= new TextEditingController();
  TextEditingController emailTextEditingController= new TextEditingController();
  TextEditingController passwordTextEditingController= new TextEditingController();

  signMeUP(){

    if(formKey.currentState.validate()){
      setState(() {
        isLoding=true;
      });

      authMethods.signInWithEmailAndPassword(emailTextEditingController.text,passwordTextEditingController.text ).then((val){
        print("${val.uid}");
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => ChatRoom()
        ));
      });

    }

  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appBarmain(context),
        body:isLoding ? Container(
          child: Center(child: CircularProgressIndicator())
        ):SingleChildScrollView(
          child: Container(
            height:MediaQuery.of(context).size.height-50,
            alignment:Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal:24),
              child: Column(
                  mainAxisSize:MainAxisSize.min,
                  children:[
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                              validator: (val){
                                return val.isEmpty || val.length<2 ?"Please provide a valid Username"   :null;
                              },
                              controller: userNameTextEditingController,
                              style:simpleTextStyle(),
                              decoration:textfieldInputDecoration("Username")
                          ),
                          TextFormField(

                              controller: emailTextEditingController,
                              style:simpleTextStyle(),
                              decoration:textfieldInputDecoration("email")
                          ),
                          TextFormField(
                              obscureText: true,
                              validator: (val){
                                return val.isEmpty || val.length<6 ?"Password must be atleast 6 chatachters long!!"   :null;
                              },
                              controller: passwordTextEditingController,
                              style:simpleTextStyle(),
                              decoration:textfieldInputDecoration("password")
                          ),
                        ],
                      ),
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
                        signMeUP();
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
                          child:Text("Sign-Up",style:TextStyle(
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
                        child:Text("Sign-Up with google",style:TextStyle(
                          fontSize:17 ,
                          color: Colors.black,
                        )
                        )
                    ),
                    SizedBox(height:16,),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?",style:mediumTextStyle(),),
                          Text("Sign-In",style:TextStyle(
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
