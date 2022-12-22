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
  late TextEditingController cont;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    siteName = 'chess.com';
    cont = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  controller: cont,
                  keyboardType: TextInputType.url,
                  decoration: const InputDecoration(
                    hintText: "사이트명을 입력하세요",
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (cont.text.trim().isNotEmpty) {
                    setState(() {
                      siteName = cont.text.trim();
                    });
                    FocusScope.of(context).unfocus();
                    _reloadSite();
                  }
                },
                child: const Text(
                  '이동',
                ),
              ),
            ],
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
                //웹 페이지 로딩 시작
                setState(() {
                  isLoading = true;
                });
              },
            ),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Stack(),
          ],
        ),
        floatingActionButton: FutureBuilder<WebViewController>(
          future: _controller.future,
          builder: (BuildContext context,
              AsyncSnapshot<WebViewController> snapshot) {
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
      ),
    );
  }

  //Functions//
  _reloadSite() {
    _controller.future.then((value) => value.loadUrl('https://$siteName'));
  }
}
