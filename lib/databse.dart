import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{

  DbHelper._();
  static final DbHelper getinstance= DbHelper._();
  Database? mDB;
   Future<Database? > getDB ()async{
     if (mDB!=null){
       return mDB!;
     } else{
       mDB= await openDB();
     }
   }
    Future<Database?> openDB() async{
     var Appdir= await getApplicationDocumentsDirectory();
     var dbPath= join(Appdir.path, "notes.db");
     openDatabase(dbPath,version: 1,onCreate: (db, version){

     });
   }
}