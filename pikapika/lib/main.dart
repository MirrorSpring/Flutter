// ignore_for_file: prefer_const_constructors

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
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[800],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title:Text("Image Ex01"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  backgroundImage: AssetImage('images/p1.png'),
                  radius: 50,
                )
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:const [
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/p2.png'),
                    radius: 50,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/p3.png'),
                    radius: 50,
                  ),
                ),
              ]
            )
          ],)
      ),
    );
  }
}