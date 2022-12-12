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

        primarySwatch: Colors.green,
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
          "Korea"
        )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Hello"),
            SizedBox(
              height:50,
            ),
            Text("Hallo"),
            SizedBox(
              height:30,
            ),
            Text("Hola"),
            Text("Salve"),
          ],
        ),
      ),
    );
  }
}
