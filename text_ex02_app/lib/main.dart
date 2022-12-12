// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

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
        title:const Text('text with column and row'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.email_rounded),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.account_balance),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0), //all directions(LTRB: each direction)
                  child: Icon(Icons.account_circle),
                ),
            ],),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'James'
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Cathy'
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Kenny'
                  ),
                )
            ],),
            SizedBox(
              height: 20,
            ),
          ],),
      )
    );
  }
}