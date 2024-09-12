import 'package:data_managment/animation.dart';
import 'package:data_managment/count_assignment.dart';
import 'package:data_managment/database_home.dart';
import 'package:data_managment/databasein_textfield.dart';
import 'package:data_managment/databse.dart';
import 'package:data_managment/provider.dart';
import 'package:data_managment/splash.dart';
import 'package:data_managment/update_and%20_delete.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create:  (context) => state_mnagment(dbHelper:DbHelper.getInstance()),
  child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: update(),
    );
  }
}
