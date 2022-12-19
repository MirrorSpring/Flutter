import 'package:exmp_14/view/detail_list.dart';
import 'package:exmp_14/view/insert_list.dart';
import 'package:exmp_14/view/table_list.dart';
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
      routes: {
        '/': (context) => const TableList(),
        '/insert' : (context) => const InsertList(),
        '/detail' : (context) => const DetailList(),
      },
      initialRoute: '/',
    );
  }
}
