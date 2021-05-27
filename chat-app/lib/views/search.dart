import 'package:chat/Services/Database.dart';
import 'package:chat/helper/constants.dart';
import 'package:chat/views/conversations.dart';
import 'package:chat/widgets/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController searchTextEditingController =new TextEditingController();

  QuerySnapshot  searchSnapshot;

  Widget searchList(){
    print("aearch");
    return searchSnapshot !=null? ListView.builder(
        itemCount:searchSnapshot.docs.length,
        shrinkWrap: true,
        itemBuilder: (context,index){
          return SearchTile(
              userName:searchSnapshot.docs[index].get("name"),
              userEmail:searchSnapshot.docs[index].get("Email"),
          );
        }):Container(child:Text("no users"));
  }

  initiateSearch(){
    databaseMethods
        .getUserByUsername(searchTextEditingController.text)
          .then((val){
          print("username");
          setState(() {
            searchSnapshot=val;
            print(val);

          });
        });
  }




  ///create chatroom, send user to conversation screen, pushreplacment
  createChatRoomAndStartConversation({ String userName}){

    String chatRoomId =getChatRoomId(userName, Constants.myName);

    List<String> users = [userName, Constants.myName];
    Map<String,dynamic> charRoomMap ={
      "users":users,
      "chatroomId": chatRoomId
    };

    DatabaseMethods().createChatRoom(chatRoomId,charRoomMap);
    Navigator.push(context,MaterialPageRoute(
        builder: (context)=>ConversationsScreen()
    ));
  }

  Widget SearchTile({String userName,String userEmail}){
    print("reach");
    print(userName);
    print(userEmail);
    return  Container(
      padding: EdgeInsets.symmetric(vertical:16,horizontal:24),
      child:Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName,style:mediumTextStyle(),textAlign: TextAlign.left),
              Text(userEmail, style:mediumTextStyle(),textAlign: TextAlign.left),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap:(){
              createChatRoomAndStartConversation(
                userName:userName
              );
            },
            child: Container(
              decoration:BoxDecoration(
                color:Colors.blue,
                borderRadius: BorderRadius.circular(30),
              ),
              padding:EdgeInsets.symmetric(horizontal:16,vertical:16),
              child:Text("Message",style:mediumTextStyle(),),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState(){

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarmain(context),
      body:Container(
        child:Column(
          children:[
            Container(
              color: Color(0x54FFFFFF),
              padding:EdgeInsets.symmetric(horizontal:24,vertical:16),
              child: Row(
                children:[
                  Expanded(
                      child: TextField(
                          controller: searchTextEditingController,
                          style:TextStyle(
                              color:Colors.white
                          ),
                          decoration:InputDecoration(
                            hintText: "Search Username...",
                            hintStyle: TextStyle(
                              color:Colors.white54
                            ),
                            border:InputBorder.none
                          )
                      )),
                  GestureDetector(
                    onTap:(){
                      initiateSearch();
                      print("search");
                    },
                    child: Container(
                      height:40,
                      width:40,
                      decoration:BoxDecoration(
                      gradient: LinearGradient(
                      colors:[
                        const Color(0x36FFFFFF),
                        const Color(0x0FFFFFFF)
                      ]
                      ),
                      borderRadius: BorderRadius.circular(40)
                      ),
                      padding:EdgeInsets.all(12),
                      child: Image.asset("assets/img/search.png")),
                  )
                  ]
              ),
            ),
            searchList()
          ]
        )
      ),
    );
  }
}

getChatRoomId(String a, String b) {
  if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
    return "$b\_$a";
  } else {
    return "$a\_$b";
  }
}


    