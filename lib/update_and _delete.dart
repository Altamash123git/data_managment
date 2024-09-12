import 'dart:math';

import 'package:data_managment/addnotes_page.dart';
import 'package:data_managment/databse.dart';
import 'package:data_managment/detail_page.dart';
import 'package:data_managment/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class update extends StatefulWidget {
  const update({super.key});

  @override
  State<update> createState() => _update();
}

class _update extends State<update> {
  //DbHelper dbHelper = DbHelper.getInstance();
  List<Map<String, dynamic>> allnotes = [];
  int? id;

  bool? isUpdate;

  @override
  Widget build(BuildContext context) {
    context.read<state_mnagment>().getallnotes();
    return Scaffold(
        appBar: AppBar(
          title: Text("DATABASE"),
        ),
        body: Consumer<state_mnagment>(
          builder: (_, provider, __) {
            allnotes = provider.getnotes();
            return allnotes.isNotEmpty
                ? ListView.builder(
                    itemCount: allnotes.length,
                    itemBuilder: (c, i) {
                      return ListTile(
                          //selected: id,
                          onTap: () {
                            id = i;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => detailpage(id: i)));
                          },
                          title: Text(allnotes[i][DbHelper.Column_note_title]),
                          subtitle:
                              Text(allnotes[i][DbHelper.Column_note_desc]),
                          trailing: SizedBox(
                              width: 100,
                              child: Row(children: [
                                IconButton(
                                    onPressed: () async {
                                      var title = allnotes[i]
                                          [DbHelper.Column_note_title];
                                      var desc = allnotes[i]
                                          [DbHelper.Column_note_desc];

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (c) => addnotes(
                                                    isupdate: true,
                                                    id: allnotes[i][DbHelper
                                                        .Column_note_id],
                                                    title: title,
                                                    desc: desc,
                                                  )));
                                      //showmodal(isupadte: true, id: allnotes[i][DbHelper.Column_note_id]);

                                      //add();
                                    },
                                    icon: Icon(Icons.edit))
                              ])));
                    })
                : Center(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Center(
                        child: Column(
                          children: [
                            Text("NO notes yet"),
                            SizedBox(
                              height: 15,
                            ),
                            OutlinedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (c) => addnotes()));
                                  //showmodal();

                                  //add();

                                  //add();
                                  //Navigator.pop(context);
                                },
                                child: Text("Add notes"))
                          ],
                        ),
                      ),
                    ),
                  );
          },
        ),
        floatingActionButton: context
                .watch<state_mnagment>()
                .getnotes()
                .isNotEmpty
            ? FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () async {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (c) => addnotes()));

                  //add();
                  //Navigator.pop(context);
                },
              )
            : null);
  }
}
