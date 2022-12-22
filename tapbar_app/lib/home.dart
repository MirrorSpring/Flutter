import 'package:flutter/material.dart';
import 'package:tapbar_app/page1.dart';
import 'package:tapbar_app/page2.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  //다중 상속
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller.dispose(); //메모리 누수 방지
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   title: const Center(
      //     child: Text(
      //       'Tap Bar Test',
      //     ),
      //   ),
      // ),
      body: TabBarView(
        controller: controller,
        children: const [
          FirstPage(),
          SecondPage(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.blue[100],
        height: 60,
        child: TabBar(
          labelColor: Colors.blue[600],
          indicatorColor: Colors.blue[600],
          controller: controller,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.looks_one,
              ),
              text: 'One',
            ),
            Tab(
              icon: Icon(
                Icons.looks_two,
              ),
              text: 'Two',
            ),
          ],
        ),
      ),
    );
  }
}
