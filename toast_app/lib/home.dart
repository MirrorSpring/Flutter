import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Toast',
        ),
      ),
      body: MyToast(),
    );
  }
}

class MyToast extends StatefulWidget {
  const MyToast({super.key});

  @override
  State<MyToast> createState() => _MyToastState();
}

class _MyToastState extends State<MyToast> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                flutterToast();
              },
              child: const Text(
                'Toast',
              ),
            ),
          ],
        ),
      );
  }

  flutterToast(){
    Fluttertoast.showToast(
      msg:'Toast',
      gravity: ToastGravity.BOTTOM, //Toast가 뜨는 위치
      backgroundColor: Colors.red,
      textColor: Colors.blue,
      toastLength: Toast.LENGTH_SHORT,
    );
  }
}
