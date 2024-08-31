import 'package:data_managment/login.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homepage extends StatefulWidget{
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> with SingleTickerProviderStateMixin {
  AnimationController? mcontroller;
  Animation<double>? sizeanimation;
  Animation<double>? rotanimation;
  void initState(){
    super.initState();
    mcontroller=AnimationController(vsync: this, duration: Duration(seconds: 3));
    sizeanimation= Tween<double>(begin: 0.0, end: 4.0).animate(CurvedAnimation(parent: mcontroller!, curve: Curves.easeIn));
    rotanimation=Tween<double>(begin: 0.0, end: 20.0).animate(mcontroller!);
    mcontroller!.forward();

  }
   SharedPreferences? pref;

   bool? loggedin;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('welcome home '),
        backgroundColor: Colors.pinkAccent,
        actions: [
          ElevatedButton(onPressed: () async {
           pref= await SharedPreferences.getInstance();
           await pref!.setBool(loginpage.login_key,false );

            //loggedin=false;
            //loggedoutinfo();
            Navigator.pushReplacement(context, PageTransition(child: loginpage(), type: PageTransitionType.leftToRightWithFade));

          }, child: Text("Log out"),
          )
        ],
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: mcontroller!,
          child: Container(
            alignment: Alignment.center,


            decoration: BoxDecoration(
              //color: Colors.blue,

                image: DecorationImage(image: NetworkImage("https://imgix.ranker.com/list_img_v2/13993/2773993/original/cutest-cartoon-babies?auto=format&q=50&fit=crop&fm=pjpg&dpr=2&crop=faces&h=185.86387434554973&w=355"),fit: BoxFit.contain)
            ),
            width:  200,
            height: 300,

          ),
          builder: (c,child){
            return  Transform.scale(
              scale: sizeanimation!.value,
              //scale(sizeanimation!.value),
                //..rotateX( rotanimation!.value)..rotateY(rotanimation!.value),
              child:  child!,

            );

          },

        ),
      ),
    );
  }

  /*void loggedoutinfo() async {
    //pref= await SharedPreferences.getInstance();
    //bool? passlogoutdata= loggedout;
    await pref!.setBool(loginpage.login_key,loggedin! );

  }*/
}