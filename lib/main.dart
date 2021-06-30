import 'package:flutter/material.dart';
import 'src/Screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
        ,
      ),debugShowCheckedModeBanner: false,
      home: Screen(),
    );
  }
}