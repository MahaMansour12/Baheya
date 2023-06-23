import 'package:flutter/cupertino.dart';

class customImage extends StatelessWidget {
  String imagee;
  customImage({required this.imagee});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 100,
        width: 100,
        decoration: BoxDecoration(

            color: const Color(0x51f8aca2),
            borderRadius: BorderRadius.circular(10)),child: Image(image:AssetImage(imagee),width: 80,height: 80,fit: BoxFit.cover, ),

      ),
    );
  }
}
