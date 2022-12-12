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
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title:Text(
          '영웅 Card'),
        backgroundColor: Colors.orange[900],
      ),
      body:Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const[
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("images/1670831925906.jpg"),
                    radius:70
                  ),
                ),

              ],
            ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,0),
                child: Divider(
                height:20,
                color: Colors.black,
                thickness: 0.5,
            ),
              ),
            Row(
              children: const[
                Padding(
                  padding: EdgeInsets.fromLTRB(20,10,0,10),
                  child: Text(
                    "성웅",
                    style:TextStyle(
                      color:Colors.white
                    )
                  ),
                ),
              ],
            ),
            Row(
              children: const[
                Padding(
                  padding: EdgeInsets.fromLTRB(20,10,0,10),
                  child: Text(
                    "이순신 장군",
                      style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color:Colors.white
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: const[
                Padding(
                  padding: EdgeInsets.fromLTRB(20,10,0,10),
                  child: Text(
                    "전적",
                    style:TextStyle(
                      color:Colors.white
                    )
                  ),
                ),
              ],
            ),
            Row(
              children: const[
                Padding(
                  padding: EdgeInsets.fromLTRB(20,10,0,10),
                  child: Text(
                    "62전 62승",
                    style:TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color:Colors.red
                    )
                  ),
                ),
              ],
            ),
            Row(
              children: const[
                Padding(
                  padding: EdgeInsets.fromLTRB(20,5,10,0),
                  child: Icon(Icons.check_circle_outline,size:20),
                ),
                Text(
                  '옥포해전',
                  style:TextStyle(
                    fontSize: 20
                  )
                )
              ],
            ),
            Row(
              children: const[
                Padding(
                  padding: EdgeInsets.fromLTRB(20,5,10,0),
                  child: Icon(Icons.check_circle_outline,size:20),
                ),
                Text(
                  '사천포해전',
                  style:TextStyle(
                    fontSize: 20
                  )
                )
              ],
            ),
            Row(
              children: const[
                Padding(
                  padding: EdgeInsets.fromLTRB(20,5,10,0),
                  child: Icon(Icons.check_circle_outline,size:20),
                ),
                Text(
                  '당포해전',
                  style:TextStyle(
                    fontSize: 20
                  )
                )
              ],
            ),
            Row(
              children: const[
                Padding(
                  padding: EdgeInsets.fromLTRB(20,5,10,0),
                  child: Icon(Icons.check_circle_outline,size:20),
                ),
                Text(
                  '한산도대첩',
                  style:TextStyle(
                    fontSize: 20
                  )
                )
              ],
            ),
            Row(
              children: const[
                Padding(
                  padding: EdgeInsets.fromLTRB(20,5,10,0),
                  child: Icon(Icons.check_circle_outline,size:20),
                ),
                Text(
                  '부산포해전',
                  style:TextStyle(
                    fontSize: 20
                  )
                )
              ],
            ),
            Row(
              children: const[
                Padding(
                  padding: EdgeInsets.fromLTRB(20,5,10,0),
                  child: Icon(Icons.check_circle_outline,size:20),
                ),
                Text(
                  '명량해전',
                  style:TextStyle(
                    fontSize: 20
                  )
                )
              ],
            ),
            Row(
              children: const[
                Padding(
                  padding: EdgeInsets.fromLTRB(20,5,10,0),
                  child: Icon(Icons.check_circle_outline,size:20),
                ),
                Text(
                  '노량해전',
                  style:TextStyle(
                    fontSize: 20
                  )
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/1670832004038.gif',
                  width:70),
              ],
            ),
          ],
        ),
      )
    );
  }
}