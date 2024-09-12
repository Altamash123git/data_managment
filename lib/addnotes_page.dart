import 'package:data_managment/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class addnotes extends StatelessWidget {
  bool isupdate=false;
  int id;
  String title;
  String desc;

  addnotes({this.isupdate=false, this.id=0, this.title="", this.desc=""});

  TextEditingController titlecontroller = TextEditingController();

  TextEditingController desccontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if(isupdate){
      titlecontroller.text = title;
      desccontroller.text = desc;
    }

   return Scaffold(
     appBar: AppBar(
       title: Text(isupdate?"Update":"Add note's"),
     ),
     body:
       Container(
         width: double.infinity,
         child: Column(
           children: [

             Padding(
               padding: const EdgeInsets.all(11.0),
               child: TextField(
                 controller: titlecontroller,
                 decoration: InputDecoration(
                     label: Text("title"),
                     hintText: "enter title",
                     enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10)),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10),
                     )),
               ),
             ),
             SizedBox(
               height: 15,
             ),
             Padding(
               padding: const EdgeInsets.all(11.0),
               child: TextField(
                 controller: desccontroller,
                 maxLines: 3,
                 minLines: 2,
                 decoration: InputDecoration(
                     label: Text("description"),
                     hintText: "enter desc",
                     enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10)),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10),
                     )),
               ),
             ),
             Row(
               children: [

                 Expanded(
                   child: OutlinedButton(
                       onPressed: ()  async{


                         if (titlecontroller.text.isNotEmpty && desccontroller.text.isNotEmpty) {

                           if (isupdate==false) {



                             context.read<state_mnagment>().addmynotes(
                                 title: titlecontroller.text,
                                 desc: desccontroller.text);

                           }else if(isupdate==true){
                             context.read<state_mnagment>().updatenotes(mtitle: titlecontroller.text, mdesc: desccontroller.text, id: id);
                             print("im tapped");
                             print(Provider.of<state_mnagment>(context, listen: false).getnotes());
                           }
                           Navigator.pop(context);
                         }

                       },
                       child: Text(
                           isupdate? "update" :"ADD")),
                 ),
                 Expanded(
                   child: OutlinedButton(
                       onPressed: () {
                         Navigator.pop(context);
                       },
                       child: Text("CANCEL")),
                 ),
               ],
             )
           ],
         ),
       )
   );

  }
}
