import 'package:flutter/cupertino.dart';

class customArtical extends StatelessWidget {
  String artical;
  customArtical({required this.artical});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 200,
        width: 200,
        decoration: BoxDecoration(

            color: const Color(0x51f8aca2),
            borderRadius: BorderRadius.circular(10)),child: Center(child: Text(artical,style: TextStyle(fontSize: 18,),textAlign: TextAlign.center,))
      )
      ,
    );



  }
}
