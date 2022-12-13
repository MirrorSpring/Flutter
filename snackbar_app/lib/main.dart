import 'package:flutter/material.dart';
import 'package:snackbar_app/snackbar.dart';

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

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    //context: 전 화면의 상태를 기억하는 변수(C의 포인터)
    return Scaffold(
        appBar: AppBar(
          title: const Text('Snack Bar'),
        ),
        body: const MySnackBar()
        );
  }

  // // ----------Function----------
  // snackBarFunction(BuildContext context) {
  //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //     content: Text('ElevatedButton is clicked'), //글자
  //     duration: Duration(seconds: 1),
  //     backgroundColor: Colors.redAccent,
  //   ));
  // }
}
