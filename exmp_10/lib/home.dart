import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String Korea;
  late List KoreaList;
  late String output;
  int i = 0;

  @override
  void initState() {
    super.initState();
    Korea = "대한민국";
    KoreaList = Korea.split("");
    output = "";

    Timer.periodic(
        const Duration(
          seconds: 1,
        ), (Timer timer) {
      changeStr();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LED ad"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              output,
              style: const TextStyle(
                fontSize: 70,
              ),
            ),
          ],
        ),
      ),
    );
  }

  changeStr() {
    setState(() {
      i++;
      if (i == KoreaList.length) {
        i = 0;
        output = "";
      }
      output = output + KoreaList[i];
    });
  }
}
