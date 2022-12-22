import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  late bool isLoading; //for indicator
  late String siteName; //sitename

  @override
  void initState() {
    super.initState();
    isLoading = true;
    siteName = 'chess.com';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.grey[850],
        title: Center(
          child: Column(
            children: [
              const Text(
                'Chess',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        siteName='https://www.chess.com';
                      });
                      _reloadSite();
                    },
                    child: const Text(
                      'Chess.com',
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        siteName='https://www.lichess.org';
                      });
                      _reloadSite();
                    },
                    child: const Text(
                      'Lichess',
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        siteName='http://www.chessfreak.net/xe/';
                      });
                      _reloadSite();
                    },
                    child: const Text(
                      'Chessfreak',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: siteName,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onPageFinished: (url) {
              //웹 페이지 로딩 완료
              setState(() {
                isLoading = false;
              });
            },
            onPageStarted: (url) {
              //웹 페이지 로딩 시작작
              setState(() {
                isLoading = true;
              });
            },
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
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
                snapshot.data!.goBack();
              },
              child: const Icon(
                Icons.arrow_back,
              ),
            );
          }
          return Stack();
        },
      ),
    );
  }

  //Functions//
  _reloadSite(){
    _controller.future.then((value) => value.loadUrl(siteName));
  }
}
