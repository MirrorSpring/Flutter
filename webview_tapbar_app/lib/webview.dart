import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebScreen extends StatefulWidget {
  final String url;

  const WebScreen({super.key, required this.url});

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  late bool isLoading; //for indicator
  late String siteName; //sitename

  @override
  void initState() {
    super.initState();
    isLoading = true;
    siteName = widget.url;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
      );
  }
}