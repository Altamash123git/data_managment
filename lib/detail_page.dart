import 'dart:math';

import 'package:data_managment/addnotes_page.dart';
import 'package:data_managment/databse.dart';
import 'package:data_managment/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class detailpage extends StatefulWidget {
  int id;
  detailpage({required this.id});



  @override
  State<detailpage> createState() => _detailpageState();
}

class _detailpageState extends State<detailpage> {
  List<Map<String,dynamic>> allnotes=[];
  TextEditingController titlecontroller = TextEditingController();

  TextEditingController desccontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {

    context.read<state_mnagment>().getallnotes();
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Color(0xff252525),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13.0,),
            child: IconButton(
              onPressed: () async{

                var title= allnotes[widget.id][DbHelper.Column_note_title];
                var desc= allnotes[widget.id][DbHelper.Column_note_desc];

                Navigator.push(context, MaterialPageRoute(builder:(c)=> addnotes(isupdate: true,title: title, desc: desc,)));
              },
                icon: Icon(Icons.edit_calendar,color: Colors.white,)),
          ),
        ],
      ),
      body:


      Consumer<state_mnagment>(builder: (ctx,provider, _){
        allnotes= provider.getnotes();
        return
          Container(
        width: double.infinity,
        color: Color(0xff252525),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(

              flex: 2,
              child: Container(
                //color: Colors.grey,
                child: Text(allnotes[widget.id][DbHelper.Column_note_title],style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
              ),
            ),

            Divider(
              height: 10,
              color: Colors.grey,
            ),
            Flexible(
              flex: 5,
              child: Container(
                child: Text(allnotes[widget.id][DbHelper.Column_note_desc],style: TextStyle(fontSize: 25,

                    color: Colors.white),),
                //color: Colors.yellow,
              ),
            ),
          ],
        ),
      );

      },)

    );
  }
}
