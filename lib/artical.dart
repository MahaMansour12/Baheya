import 'package:flutter/material.dart';
import 'package:untitled2/model/Data.dart';
import 'package:untitled2/shared/sharedPeferences.dart';
import 'package:untitled2/ui/home/home.dart';

class ArticalMaterialDetailScreen extends StatelessWidget {
  const ArticalMaterialDetailScreen({Key? key, required this.material}) : super(key: key);

  final   material;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(material.title??' ',style: TextStyle(color: Colors.black, fontSize: 18)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context,home_screen.routName);
            },
            child: const Icon(Icons.arrow_back_ios_new_outlined,
                color: Colors.black, size: 25)),
      ) ,
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           // Image.network(material.url?? " "),
            SizedBox(height: 16),
            Text(material.description??' ', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text(material.stage??' ', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}