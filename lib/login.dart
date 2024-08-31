import 'package:data_managment/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

class loginpage extends StatefulWidget {
  static const String login_key="isloogedin";

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  TextEditingController namecontroller=TextEditingController();

  TextEditingController paswwordcontroller=TextEditingController();

   bool? loggedin;

  SharedPreferences? pref;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(
       title: Text("Log In"),
       centerTitle: true,

     ),

     body: Center(

       child: Stack(
         children: [
           Container(
             //color: Colors.pinkAccent,
             child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 25),
                   child: Container(
                     margin: EdgeInsets.all(10),
                     child: TextField(

                       controller: namecontroller,
                       decoration:  InputDecoration(
                         border: OutlineInputBorder(),
                         hintText: "Enter user name"
                       ),
                     ),
                   ),
                 ),
                 Padding(

                   padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 20),
                   child: Container(
                      margin: EdgeInsets.all(10),
                     child: TextField(
                       controller: paswwordcontroller,
                       decoration:  InputDecoration(
                         border:  OutlineInputBorder(),
                         hintText: "Enter password",
                         suffixIcon: Icon(Icons.remove_red_eye)

                       ),
                     ),
                   ),
                 ),


                 ElevatedButton(
                     style: ElevatedButton.styleFrom(
                       //maximumSize: Size(100, 30),
                       backgroundColor: Colors.greenAccent,
                       minimumSize: Size(150, 50)
                     ),
                     onPressed: (){

                   loggedin=true;
                   getlogininfo();
                   Navigator.pushReplacement(context, PageTransition(child: homepage(), type: PageTransitionType.rightToLeft));
                 }, child: Text("log in", style: TextStyle(fontSize: 22),))
               ],
             ),
           ),
         ],
       ),
     ),
   );
  }

   void getlogininfo () async {
    pref = await SharedPreferences.getInstance();
   //bool? passdata=loggedin;
   await pref!.setBool(loginpage.login_key, loggedin!);


   }
}