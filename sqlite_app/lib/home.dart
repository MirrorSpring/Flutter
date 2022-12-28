import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sqlite_app/database_handler.dart';
import 'package:sqlite_app/students.dart';
import 'package:sqlite_app/update.dart';

import 'insert.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DatabaseHandler handler;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    handler.initializeDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SQLite for Students',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const InsertPage();
                  },
                ),
              ).then((value) {
                setState(() {
                  handler.queryStudents();
                });
              });
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: handler.queryStudents(),
        builder:
            ((BuildContext context, AsyncSnapshot<List<Students>> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                itemCount: snapshot.data?.length, //null safety
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return UpdatePage(sid: snapshot.data![index].id);
                          },
                        ),
                      ).then((value) {
                        setState(() {
                          handler.queryStudents();
                        });
                      });
                    },
                    onHorizontalDragEnd: (details) {
                      handler
                          .deleteStudents(snapshot.data![index].id!)
                          .whenComplete(() {
                        setState(() {
                          handler.queryStudents();
                        });
                      });
                    },
                    child: Dismissible(
                      key: Key(snapshot.data![index].code),
                      onDismissed: (direction) {
                        handler.deleteStudents(snapshot.data![index].id!);
                      },
                      background: Container(
                        color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Icon(
                              Icons.delete,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                      child: SizedBox(
                        width: 500,
                        child: Card(
                          margin: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Visibility(
                                visible: false,
                                child: Text(
                                  "Code: ${snapshot.data![index].id}",
                                  style: const TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Code: ${snapshot.data![index].code}",
                                  style: const TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Name: ${snapshot.data![index].name}",
                                  style: const TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Dept: ${snapshot.data![index].dept}",
                                  style: const TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Phone: ${snapshot.data![index].phone}",
                                  style: const TextStyle(
                                    fontSize: 30,
                                  ),
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
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
