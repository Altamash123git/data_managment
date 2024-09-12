import 'package:data_managment/databse.dart';
import 'package:flutter/material.dart';

class newpage extends StatefulWidget {
  const newpage({super.key});

  @override
  State<newpage> createState() => _newpageState();
}

class _newpageState extends State<newpage> {
  DbHelper mdbhelper=DbHelper.getInstance();
  List<Map<String,dynamic>> notes=[];
  TextEditingController? titleconroller;
  TextEditingController? descconroller;

  @override
  void initState(){
    titleconroller=TextEditingController();
    descconroller=TextEditingController();
    super.initState();
    getnotes();
    setState(() {

    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
body:SingleChildScrollView(
  child: Column(
    children: [Padding(
      padding: const EdgeInsets.all(18.0),
      child: TextField(
        controller: titleconroller,
        decoration: InputDecoration(
          hintText: "enter title",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),


        ),
      ),
    ),
      Padding(
        padding: const EdgeInsets.all(18.0),
        child: TextField(

          controller: descconroller,
          decoration: InputDecoration(
            hintText: "enter your notes here",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),


          ),

        ),
      ),
      ElevatedButton(onPressed: () async{

        //if (titleconroller!.text !=""&&  descconroller!.text !="") {
          bool check = await mdbhelper.addnote(
              title: ("hi"), desc: "baby");
          if (check)
          {
            getnotes();
          }
       // }

      }, child: Text("save")),

     Container(
       height: 400,
       child: ListView.builder(
         itemCount: notes.length,
           itemBuilder: (c,i){
         return ListTile(



           title: Text(notes[i][DbHelper.Column_note_title]),
           subtitle: Text(notes[i][DbHelper.Column_note_desc]),
         );
       }),
     )

    ],
  ),
),
    );
  }
  void getnotes() async{
    notes = await mdbhelper.getnotes();
    setState(() {
      print(notes);

    });



  }
}
