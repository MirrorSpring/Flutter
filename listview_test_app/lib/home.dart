import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<int> todolist = [];

  @override
  void initState() {
    super.initState();
    for (int i = 1; i <= 30; i++) {
      todolist.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(
          child: Text(
            'Pikachu',
          ),
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: todolist.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 200,
              child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                            child: Image.asset(
                              index % 3 == 0
                                  ? 'images/p3.png'
                                  : index % 3 == 1
                                      ? 'images/p1.png'
                                      : 'images/p2.png',
                              width: 30,
                            ),
                          ),
                          const Text(
                            'Pikachu!',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      duration: const Duration(milliseconds: 1000),
                      backgroundColor: index % 3 == 0
                          ? Colors.yellow[400]
                          : index % 3 == 1
                              ? Colors.yellow[600]
                              : Colors.yellow[800],
                    ),
                  );
                },
                child: Card(
                  color: index % 3 == 0
                      ? Colors.yellow[400]
                      : index % 3 == 1
                          ? Colors.yellow[600]
                          : Colors.yellow[800],
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            index % 3 == 0
                                ? 'images/p3.png'
                                : index % 3 == 1
                                    ? 'images/p1.png'
                                    : 'images/p2.png',
                          ),
                        ),
                        Text(
                          index % 3 == 2 ? 'Chu' : 'Pika',
                          style: const TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
