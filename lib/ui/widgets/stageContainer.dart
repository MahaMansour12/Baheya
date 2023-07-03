import 'package:flutter/material.dart';

class StageConteniar extends StatelessWidget {
  var artical;
  var title;
  StageConteniar({required this.artical,required this.title});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
          padding: const EdgeInsets.all(10),
          height: 200,
          width:double.infinity,
          decoration: BoxDecoration(

              color: const Color(0x51f8aca2),
              borderRadius: BorderRadius.circular(10)),

          child:Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [Text('$title',style: TextStyle(fontSize: 18),),SizedBox(width: 100),Icon(Icons.arrow_forward_ios,)]),
            ),
            Center(child: Text(artical,style: TextStyle(fontSize: 14),))
          ],)
      )
      ,
    );



  }
}
