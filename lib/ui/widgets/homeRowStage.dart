import 'package:flutter/material.dart';

class homeStage extends StatelessWidget {
  String image;
  String name;
  homeStage({required this.image,required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
              padding: const EdgeInsets.all(10),
          height: 70,
          width: 70,
          decoration: BoxDecoration(

          color: const Color(0x51f8aca2),
          borderRadius: BorderRadius.circular(30)),child: Image(image:AssetImage(image) ,height: 50,width: 50),

          ),
        ),
        Text(name, style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 15),),
      ],
    );
  }
}
