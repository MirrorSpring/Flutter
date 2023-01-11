import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<String> moveList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moveList = [];
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
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('chessgames').where('gameid', isEqualTo: 'qwer').snapshots(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                    final document=snapshot.data!.docs;
                    return document.map((e) => _board(e)).first;

                    }
                    return SizedBox();
                  },
                ),
              ),
            ),
          ),
          // Expanded(
          //   child: ValueListenableBuilder<Chess>(
          //     valueListenable: controller,
          //     builder: (context, game, _) {
          //       return ListView.builder(
          //         itemCount: moveList.length,
          //         itemBuilder: (context, index) {
          //           if (index == 0) {
          //             index++;
          //             return const SizedBox();
          //           } else {
          //             return Card(
          //               color: index % 2 == 0 ? Colors.brown[50] : Colors.white,
          //               child: Center(
          //                 child: Padding(
          //                   padding: const EdgeInsets.all(8.0),
          //                   child: Text(
          //                     moveList[index],
          //                     style: const TextStyle(
          //                       fontSize: 20,
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             );
          //           }
          //         },
          //       );
          //     },
          //   ),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  //
                  
                },
                child: const Icon(
                  Icons.arrow_back,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                                            FirebaseFirestore.instance.collection('chessgames').doc('dQEDdLpaS7MsjKg45wjD').update(
                          {'fen':'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1'});
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

class cBoard extends StatefulWidget {
  final String fen;
  const cBoard({super.key,required this.fen});

  @override
  State<cBoard> createState() => _cBoardState();
}

class _cBoardState extends State<cBoard> {
  late ChessBoardController controller;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=ChessBoardController();

  }

  @override
  Widget build(BuildContext context) {
        controller.loadFen(widget.fen);
    return ChessBoard(
                    controller: controller,
                    boardColor: BoardColor.brown,
                    boardOrientation: PlayerColor.white,
                    onMove: () async{
                      setState(() {
                        // moveList = controller
                        //     .getSan()
                        //     .fold(
                        //       '',
                        //       (previousValue, element) =>
                        //           previousValue + '\n' + (element ?? ''),
                        //     )
                        //     .split('\n');
                          FirebaseFirestore.instance.collection('chessgames').doc('dQEDdLpaS7MsjKg45wjD').update(
                          {'fen':controller.getFen()});
                
                      });
                    },
                  );
  }
}

Widget _board(DocumentSnapshot doc){
  final fen=doc['fen'];

  return cBoard(fen: fen);
}