import 'package:exmp_20/add.dart';
import 'package:exmp_20/detail.dart';
import 'package:flutter/material.dart';

import 'model/opening.dart';
import 'model/openingclass.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Opening> opening;

  @override
  void initState() {
    super.initState();
    opening = [];
    opening.add(Opening(name: 'Italian Game', firstmove: "1. e4"));
    opening.add(Opening(name: 'Scotch Gambit', firstmove: "1. e4"));
    opening.add(Opening(name: 'Sicilian Defense', firstmove: "1. e4"));
    opening.add(Opening(name: 'King\'s Indian Attack', firstmove: "Others"));
    opening.add(Opening(name: 'Catalan Opening', firstmove: "1. d4"));
    opening.add(Opening(name: 'Bongcloud', firstmove: "Others"));
    opening.add(Opening(name: 'Grunfeld Defense', firstmove: "1. d4"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Chess Opening',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const Add();
                  },
                ),
              ).then((value) => reBuild());
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),

      //---------------BODY---------------//
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: opening.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //가로줄에 들어갈 개수
              crossAxisSpacing: 10, //간격
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Message.name = opening[index].name;
                  Message.firstmove = opening[index].firstmove;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const DetailPage();
                      },
                    ),
                  );
                },
                child: Container(
                  color: Colors.black,
                  child: Card(
                    color: Colors.blue[100],
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            opening[index].name,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  reBuild() {
    if (Message.isnew) {
      setState(() {
        opening.add(Opening(name: Message.name, firstmove: Message.firstmove));
        Message.isnew = false;
      });
    }
  }
}
