import 'package:flutter/material.dart';

import 'model/opening.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late String name;
  late String firstmove;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Opening Detail',
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '오프닝 이름: ${Message.name}',
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              '첫 수: ${Message.firstmove}',
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
