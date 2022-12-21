import 'package:collection_view_label_app/model/opening.dart';
import 'package:flutter/material.dart';

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
    opening=[];
    opening.add(Opening(name: 'Italian Game', image: 'italian.jpeg'));
    opening.add(Opening(name: 'Queen\'s Gambit', image: 'qg.jpeg'));
    opening.add(Opening(name: 'French Defense', image: 'french.jpeg'));
    opening.add(Opening(name: 'Ruy Lopez', image: 'ruylopez.jpeg'));
    opening.add(Opening(name: 'Sicilian Defense', image: 'sicilian.jpeg'));
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
              //--
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
            return Container(
              color: Colors.black,
              child: Card(
                child: Column(
                  children: [
                    Text(
                      opening[index].name,
                    ),
                    Image.asset(
                      'images/${opening[index].image}',
                      width: 100,
                      height: 100,
                    ),
                  ],
                ),
              ),
            );
          }),
      ),
      
    );
  }
}
