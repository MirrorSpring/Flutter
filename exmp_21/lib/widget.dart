import 'package:flutter/material.dart';

class Rotation extends StatefulWidget {
  final String labeltxt;
  final bool vsbl;
  const Rotation({super.key, required this.labeltxt, required this.vsbl});

  @override
  State<Rotation> createState() => _RotationState();
}

class _RotationState extends State<Rotation> {
  bool switchvalue=false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  //
                },
                child: Text(
                  widget.labeltxt,
                ),
              ),
              Visibility(
                visible: widget.vsbl,
                child: Switch(
                  value: switchvalue,
                  onChanged: (value) {
                    setState(() {
                      switchvalue=value;
                    });
                  },
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
