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
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar:AppBar(
        title: const Text("Image Test"),
      ),
      body: SingleChildScrollView( //Make it able to be scrolled
        scrollDirection: Axis.vertical, //Default: vertical, can be set horizontal
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'Images/board.gif',
                width:200,
                fit:BoxFit.contain, //Original ratio
              ),
              Image.asset(
                'Images/FD4Wi4RXwAIhdVO.jpeg',
                width:300,
                height:200,
                fit:BoxFit.fill //Custom ratio
              ),
              Image.asset(
                'Images/FD4Wi4RXwAIhdVO.jpeg',
                width:100,
                height:200,
                fit:BoxFit.cover //Cut
              ),
              Image.asset(
                'Images/FD4Wi4RXwAIhdVO.jpeg',
                width:200,
                fit:BoxFit.contain, //Original ratio
              ),
              Image.asset(
                'Images/FD4Wi4RXwAIhdVO.jpeg',
                width:200,
                fit:BoxFit.contain, //Original ratio
              ),
              Image.asset(
                'Images/FD4Wi4RXwAIhdVO.jpeg',
                width:200,
                fit:BoxFit.contain, //Original ratio
              ),
            ],
          ),
        ),
      ),
    );
  }
}