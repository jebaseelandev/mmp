import 'package:dmp/View/mmp.dart';
import 'package:dmp/class/themeData.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MMP(),
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: themedata.Sbackground,
        ),
      );
}
