import 'package:flutter/material.dart';

class StageTap extends StatelessWidget {
  String text;
  bool isSelected;

  StageTap({required this.text ,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
      padding: const EdgeInsets.all(3),

      child: Container(
      margin: EdgeInsets.all(2),
      padding: EdgeInsets.all(4),
      height: 40,
      width: 165,
      decoration: BoxDecoration(
      border: Border.all(width: 1, color: Colors.grey),
      color: isSelected? Color(0x94f8aca2):Colors.transparent,
      borderRadius: BorderRadius.circular(10)),
      child:  Text(
      '$text',
      textAlign: TextAlign.center,
      style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black),

      )
      ),
    );
  }
}

