import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_tapbar_app/webview.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController controller;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  late bool isLoading; //for indicator
  late String siteName; //sitename

  @override
  void initState() {
    super.initState();
    isLoading = true;
    siteName = 'chess.com';
    controller = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Center(
          child: Column(
            children: const [
              Text(
                'Chess',
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: const [
          WebScreen(url: 'https://www.chess.com'),
          WebScreen(url: 'https://www.lichess.org'),
          WebScreen(url: 'http://www.chessfreak.net')
        ],
      ),
      floatingActionButton: FutureBuilder<WebViewController>(
        future: _controller.future,
        builder:
            (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
          //snapshot: context의 네트워크 버전
          if (snapshot.hasData) {
            return FloatingActionButton(
              backgroundColor: Colors.green[600],
              onPressed: () {
                snapshot.data!.goBack(); //뒤로
              },
              child: const Icon(
                Icons.arrow_back,
              ),
            );
          }
          return Stack();
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.blue[100],
        height: 60,
        child: TabBar(
          labelColor: Colors.blue[600],
          indicatorColor: Colors.blue[600],
          controller: controller,
          tabs: [
            Tab(
              icon: Image.network(
                'https://images.chesscomfiles.com/uploads/v1/images_users/tiny_mce/SamCopeland/phpmeXx6V.png',
                height: 20,
                width: 20,
              ),
              text: 'Chess.com',
            ),
            Tab(
              icon: Image.network(
                'https://static-00.iconduck.com/assets.00/lichess-icon-256x256-59sv4p0m.png',
                height: 20,
                width: 20,
              ),
              text: 'Lichess',
            ),
            Tab(
              icon: Image.network(
                'https://yt3.googleusercontent.com/wYXlFo1dNHDwHiQVaV599NEY-SP8GwRtPIo1hG2Do5u2BUtIymgxgjW-hRqwqoLfV0AJAq6y7w=s176-c-k-c0x00ffffff-no-rj',
                width: 20,
                height: 20,
              ),
              text: 'Chessfreak',
            ),
          ],
        ),
      ),
    );
  }
}
