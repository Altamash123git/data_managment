//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:data_managment/homepage.dart';
import 'package:data_managment/login.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splash extends StatefulWidget{

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> with SingleTickerProviderStateMixin {
  AnimationController? mcontroller;
  Animation<double>? scale;

  //const splash({super.key});
  bool? alreadylogin;
  String key="logininfo";

  SharedPreferences? pref;
  void initState(){
    super.initState();
    getloginfo();
    mcontroller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    scale= Tween<double>(begin: 0.0, end:4).animate(CurvedAnimation(parent: mcontroller!, curve: Curves.bounceInOut));

    mcontroller!.forward();

  }


  @override

  Widget build(BuildContext context) {

    Timer(Duration(seconds:3), (){

      Navigator.pushReplacement(context, PageTransition(
            child:

         alreadylogin ==true? homepage():loginpage(), type: PageTransitionType.leftToRight));

    });
    // TODO: implement build
   return Scaffold(
     body:  Center(
       child: AnimatedBuilder(
          animation: mcontroller!,
         child: Container(

           width: 100,
           height: 100,
           decoration: BoxDecoration(
             //color: Colors.blue,
             image: DecorationImage(image: NetworkImage("https://cdn.vectorstock.com/i/500p/90/39/waving-hello-emoticon-vector-6769039.jpg"),fit: BoxFit.contain),

           ),

         ),
         builder: (c,child){
            return Transform.scale(
              scale: scale!.value,
              child: child!,
            );
         },
       )
     ),
   );

  }
  void getloginfo() async {

    pref = await SharedPreferences.getInstance();
    alreadylogin= await pref!.getBool(loginpage.login_key);
    setState(() {


      /*if (pref!.getBool("shareddata")){

        alreadylogin=true;
      } else if(pref!.getBool("sharedata")?? false){

        alreadylogin=false;

      }*/

      /*alreadylogin=pref!.getBool("sharedata");
      alreadylogin=pref!.getBool("shareddata");*/



      //alreadylogin=pref!.getBool("shareddata")?? pref!.getBool("sharedata");
      print(alreadylogin);



    });



     //alreadylogin = pref!.getBool(key)??false;


     //await pref!.setBool(key, alreadylogin!);
  }
}