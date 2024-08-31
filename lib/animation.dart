import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class animation extends StatefulWidget{
  State<animation> createState()=>_animation();
}
class _animation extends State<animation> with SingleTickerProviderStateMixin{
  AnimationController? mcontroller;
  Animation<double>? rotanimation;
  void initState(){
    super.initState();
    mcontroller= AnimationController(vsync: this, duration: Duration(seconds: 4));
    rotanimation= Tween<double>(begin: 0, end: 10).animate(mcontroller!);
    /*mcontroller!.addListener((){
      setState(() {

      });
    });*/
    //mcontroller!.forward();
  }
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
   return Scaffold(
     body:  Center(
       child:AnimatedBuilder(
         animation: mcontroller!,
         child: Container(
           width: 400,
           height: 400,
           color: Colors.blue,

         ),
         builder: (c, child){
           return Transform.rotate(
               child: child!,
               angle: rotanimation!.value);

         },
       )
     ),
   );
  }

}