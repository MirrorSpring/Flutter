import 'package:flutter/material.dart';
import 'package:login_app/home.dart';

import 'addlist.dart';
import 'list.dart';

class SecondPage extends StatefulWidget {
  final String id;
  final String pw;

  const SecondPage({super.key, required this.id, required this.pw});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>
    with SingleTickerProviderStateMixin {
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
          '동물 친구 찾기',
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const Home();
                  },
                ),
              );
            },
            child: const Text(
              'Logout',
            ),
          ),
        ],
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
