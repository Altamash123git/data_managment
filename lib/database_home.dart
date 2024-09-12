
import 'package:data_managment/databse.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  DbHelper dbHelper=DbHelper.getInstance();
  List<Map<String,dynamic>> allnotes=[];

  @override
  void initState(){
    super.initState();
    getallnotes();
  }
  Widget build(BuildContext context) {

     return Scaffold(
       body: ListView.builder(
           itemCount: allnotes.length,
           itemBuilder: (c,i){
return ListTile(

  title:Text( allnotes[i][DbHelper.Column_note_title],style: TextStyle(color: Colors.blue),),
  subtitle: Text(allnotes[i][DbHelper.Column_note_desc]),
  trailing: Text("hlo"),
);
       }),

       floatingActionButton: FloatingActionButton(




         onPressed: () async {
           bool check= await dbHelper.addnote(title: "do something",
               desc: "i don't think you can do anything");
           if (check){
             getallnotes();
           }
         },
         child: Icon(Icons.add),

       ),
     );

  }
 void getallnotes() async{
    allnotes= await dbHelper .getnotes();
    print(allnotes);
    setState(() {

    });

  }
}

