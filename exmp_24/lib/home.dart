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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<WebViewController>(
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
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<WebViewController>(
              future: _controller.future,
              builder:
                  (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
                //snapshot: context의 네트워크 버전
                if (snapshot.hasData) {
                  return FloatingActionButton(
                    backgroundColor: Colors.green[600],
                    onPressed: () {
                      setState(() {
                        snapshot.data!.reload(); //새로고침
                      });
                      
                    },
                    child: const Icon(
                      Icons.refresh,
                    ),
                  );
                }
                return Stack();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<WebViewController>(
              future: _controller.future,
              builder:
                  (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
                //snapshot: context의 네트워크 버전
                if (snapshot.hasData) {
                  return FloatingActionButton(
                    backgroundColor: Colors.green[600],
                    onPressed: () {
                      snapshot.data!.goForward(); //앞으로
                    },
                    child: const Icon(
                      Icons.arrow_forward,
                    ),
                  );
                }
                return Stack();
              },
            ),
          ),
        ],
      ),
    );
  }
}
