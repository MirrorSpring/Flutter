import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/third.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
      getPages: [
        GetPage(
          name: '/third',
          page: () {
            return const ThirdPage();
          },
        ),
      ],
    );
  }
}
