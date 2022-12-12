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

class Home extends StatelessWidget{
  const Home({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Text Excercise 01"
        ),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center, //start: left, center: center, end: right
              children: const [

                Text("Hello"),
                SizedBox(
                  width:20,
                ),
                Text("Hallo"),
                SizedBox(
                  width:20,
                ),            
              ],
            ),
                  Divider(
                  height:20,
                  color: Colors.red,
                  thickness: 0.5,
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Salve",
                    style: TextStyle(
                    color:Colors.blue,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5,
                ),),
                SizedBox(
                  width:20,
                ),                
                Text("Hola"),
            ],),
            ],
        ),
      ),
    );
  }
}
