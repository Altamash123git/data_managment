//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();

  static DbHelper getInstance() => DbHelper._();
  Database? mDB;
  static final String Table_note_name = "notes";
  static final String Column_note_id = "note_id";
  static final String Column_note_title = "note_title";
  static final String Column_note_desc = "note_desc";
  Future<Database> getDB() async {
    if (mDB != null) {
      return mDB!;
    } else {
      mDB = await openDB();
      return mDB!;
    }
  }

  Future<Database> openDB() async {
    var Appdir = await getApplicationDocumentsDirectory();
    var dbPath = join(Appdir.path, "notes.db");
    return openDatabase(dbPath, version: 1, onCreate: (db, version) {
      db.execute(
          "create table $Table_note_name ( $Column_note_id integer primary key autoincrement, $Column_note_title text, $Column_note_desc text)");
    });
  }

  Future<bool> addnote({required String title, required String desc}) async {
    var db = await getDB();
    int rowsaffected = await db.insert(Table_note_name, {
      Column_note_title: title,
      Column_note_desc: desc,
    });

    return rowsaffected > 0;
  }

  Future<List<Map<String, dynamic>>> getnotes() async {
    var db = await getDB();
    List<Map<String, dynamic>> mdata = await db.query(Table_note_name);

    return mdata;
  }

  Future<bool> updatenotes(
      {required String title, required String desc, required int id}) async {
    var db = await getDB();
    int updated = await db.update(
        Table_note_name,
        {
          Column_note_title: title,
          Column_note_desc: desc,
        },
        where: " $Column_note_id = $id");

    return updated > 0;
  }
  Future <bool> deletenotes({required int id}) async{
    var db=  await getDB();


    int deleted= await db.delete(Table_note_name, where: " $Column_note_id = $id");


    return deleted>0;

}
} /*
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{

  ///singleton class
  /// 1 creating a private constructor
  DBHelper._();

  /// 2 globally distribute
  static DBHelper getInstance() => DBHelper._();


  ///getDB

  Database? mDB;

  ///
  static final String TABLE_NOTE_NAME = "note";
  static final String COLUMN_NOTE_ID = "note_id";
  static final String COLUMN_NOTE_TITLE = "note_title";
  static final String COLUMN_NOTE_DESC = "note_desc";

  Future<Database> getDB() async{
    if(mDB!=null){
      return mDB!;
    } else {
      mDB = await openDB();
      return mDB!;
    }
  }

  Future<Database> openDB() async {

    var appDir = await getApplicationDocumentsDirectory();
    var dbPath = join(appDir.path, "notes.db");


    return openDatabase(dbPath, version: 1, onCreate: (db, version){

      /// create all your tables here
      db.execute("create table $TABLE_NOTE_NAME ( $COLUMN_NOTE_ID integer primary key autoincrement, $COLUMN_NOTE_TITLE text, $COLUMN_NOTE_DESC text)");

    });

  }

  ///db functions (queries)
  ///insert
  Future<bool> addNote({required String title, required String desc}) async{

    Database db = await getDB();

    int rowsEffected = await db.insert(TABLE_NOTE_NAME, {
      COLUMN_NOTE_TITLE : title,
      COLUMN_NOTE_DESC : desc
    });

    return rowsEffected>0;

  }

  ///fetch
  Future<List<Map<String, dynamic>>> getAllNotes() async{
    var db = await getDB();

    List<Map<String, dynamic>> mData = await db.query(TABLE_NOTE_NAME);

    return mData;
  }


}
*/
