import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final String title;
  final String image;

  const Detail({super.key, required this.title, required this.image});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.title,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.network(
                widget.image,
              ),
            ),
            Text(
              '제목: ${widget.title}',
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
