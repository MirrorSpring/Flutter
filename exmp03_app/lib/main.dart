import 'package:exmp03_app/screen.dart';
import 'package:exmp03_app/screen1.dart';
import 'package:exmp03_app/screen2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
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
