import 'package:flutter/material.dart';

class StageTap extends StatelessWidget {
  String text;
  StageTap({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
    height: 50,
    width: 80,
    decoration: BoxDecoration(
    border: Border.all(width: 1, color: Colors.grey),
    color: const Color(0x94f8aca2),
    borderRadius: BorderRadius.circular(10)),
    child:  Text(
    '$text',
    textAlign: TextAlign.center,
    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),

    )
    );
  }
}

