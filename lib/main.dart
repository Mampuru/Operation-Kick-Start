import 'package:flutter/material.dart';
import 'package:oks/contants.dart';
import 'package:oks/views/sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Community',
      theme: ThemeData(
        primarySwatch: PrimaryColor,
      ),
      home: SignIn(),
    );
  }
}


