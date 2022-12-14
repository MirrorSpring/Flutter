import 'package:exmp_04/home.dart';
import 'package:exmp_04/screen1.dart';
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
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes:{
        '/':(context) => const Home(),
        '/1st':(context) => const Screen1(),
      }
    );
  }
}
