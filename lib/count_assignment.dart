import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

class count_assign extends StatefulWidget {
  State<count_assign> createState() => _count();
}

class _count extends State<count_assign> with SingleTickerProviderStateMixin {
  AnimationController? mcontroller;
  Animation<double>? rotateanimation;
  SharedPreferences? pref;
  int count = 0;
  var bgcolor;
  bool isdivisble3 = false;
  void initState() {
    super.initState();
    mcontroller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    rotateanimation =
        Tween<double>(begin: 0.0, end: 360.0).animate(mcontroller!);

    getcount();
    mcontroller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Count"),
        centerTitle: true,
      ),
      body: Center(
        child: isdivisble3 == true
            ? AnimatedBuilder(
                child: Container(
                  width: 400,
                  height: 200,
                  color: bgcolor,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        count.toString(),
                        style: TextStyle(fontSize: 50),
                      )),
                ),
                animation: mcontroller!,
                builder: (c, child) {
                  return Transform.rotate(

                    //scale: rotateanimation!.value,

                    angle: rotateanimation!.value,
                    child: child,
                  );
                })
            : Container(
                /*transform: Transform.rotate(angle: 2pi),
   duration: Duration(seconds: 4),*/

                width: 500,
                height: 400,
                color: bgcolor,
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      count.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 45),
                      textAlign: TextAlign.center,
                    )),
              ),
      ),
    );
  }

  void getcount() async {
    pref = await SharedPreferences.getInstance();
    count = pref!.getInt('opencount') ?? 0;

    count++;

    ///print(count);

    await pref!.setInt('opencount', count);

    if (count % 3 == 0) {
      isdivisble3 = true;
      bgcolor = Colors.pinkAccent;
    } else {
      bgcolor = Colors.blue;
    }
    setState(() {});
  }
}
