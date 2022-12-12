// ignore_for_file: prefer_const_constructors

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
      backgroundColor: Colors.yellow[100],
      appBar:AppBar(
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
        title: const Text("Image Padding"),
      ),
      body:SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                "images/p1.png",
                width:200
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("pika",
                    style:TextStyle(
                    color:Colors.yellow[600],
                    fontSize: 25
                    )),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                "images/p2.png",
                width:200
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("pika",
                    style:TextStyle(
                    color:Colors.yellow[600],
                    fontSize: 25
                    )),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                "images/p3.png",
                width:200
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("CHUUUUUU!",
                      style: TextStyle(
                      color:Colors.yellow[600],
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5,)
              ),
            ),
          ],)
        ),
      )
    );
  }
}
