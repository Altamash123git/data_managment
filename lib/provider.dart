

import 'package:data_managment/databse.dart';
import 'package:flutter/material.dart';

class state_mnagment extends ChangeNotifier{
  DbHelper dbHelper;
  state_mnagment({required this.dbHelper});

  List<Map<String, dynamic>> _data=[];

  List<Map<String, dynamic>>  getnotes() => _data;

  void addmynotes( {required String title, required String desc}) async{
    bool check= await dbHelper.addnote(title: title, desc: desc);
    if (check){
      _data= await dbHelper.getnotes();
      notifyListeners();
    }


  }
  void getallnotes() async{
    _data= await dbHelper.getnotes();
    notifyListeners();
  }
void updatenotes({required String mtitle, required String mdesc, required int id}) async{
    bool check= await dbHelper.updatenotes(title: mtitle, desc: mdesc, id: id);
    _data= await dbHelper.getnotes();
    notifyListeners();
    if (check){

    }
}
}