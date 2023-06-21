import 'package:flutter/material.dart';

class formData extends StatelessWidget {
  IconData userIcon;
  String textData;
  formData({required this.userIcon,required this.textData});




  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

      Icon(userIcon,color: Colors.black,size: 30),
      SizedBox(width: 10,),
      Text('$textData',style: TextStyle(color: Colors.black,fontSize: 18),),

    ],);
  }
}
