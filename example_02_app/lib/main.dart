import 'package:example_02_app/screen.dart';
import 'package:example_02_app/screen1.dart';
import 'package:example_02_app/screen2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes:{
        '/':(context) => const Screen(),
        '/1st':(context) => const Screen1(),
        '/2nd':(context) => const Screen2()
      }
    );
  }
}