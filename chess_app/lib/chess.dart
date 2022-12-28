import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ChessBoardController controller;
  late List<String> moveList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moveList = [];
    controller = ChessBoardController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chess Demo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: ChessBoard(
                  controller: controller,
                  boardColor: BoardColor.brown,
                  boardOrientation: PlayerColor.white,
                  onMove: () {
                    setState(() {
                      moveList = controller
                          .getSan()
                          .fold(
                            '',
                            (previousValue, element) =>
                                previousValue + '\n' + (element ?? ''),
                          )
                          .split('\n');
                    });
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<Chess>(
              valueListenable: controller,
              builder: (context, game, _) {
                return ListView.builder(
                  itemCount: moveList.length,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      index++;
                      return const SizedBox();
                    } else {
                      return Card(
                        color: index % 2 == 0 ? Colors.brown[50] : Colors.white,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              moveList[index],
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  controller.undoMove();
                  
                },
                child: const Icon(
                  Icons.arrow_back,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.resetBoard();
                  setState(() {
                    moveList.clear();
                  });
                },
                child: const Icon(
                  Icons.refresh,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  //--
                },
                child: const Icon(
                  Icons.arrow_forward,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
