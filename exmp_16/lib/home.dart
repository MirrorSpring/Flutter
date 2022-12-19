import 'package:exmp_16/addlist.dart';
import 'package:exmp_16/list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Listview Test',
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: const [
          AnimalList(),
          AddList(),
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
                Icons.list,
              ),
              text: 'List',
            ),
            Tab(
              icon: Icon(
                Icons.add,
              ),
              text: 'Add',
            ),
          ],
        ),
      ),
    );
  }
}
