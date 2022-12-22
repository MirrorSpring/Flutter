import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class InsertView extends StatefulWidget {
  const InsertView({super.key});

  @override
  State<InsertView> createState() => _InsertViewState();
}

class _InsertViewState extends State<InsertView> {
  late TextEditingController nameCont;
  late TextEditingController contentCont;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameCont=TextEditingController();
    contentCont=TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Insert',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                controller: nameCont,
                decoration: const InputDecoration(
                  hintText: "작성자",
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                controller: nameCont,
                decoration: const InputDecoration(
                  hintText: "내용",
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                
              },
              child: const Text(
                '입력',
              ),
              ),
          ],
        ),
      )
    );
  }
}