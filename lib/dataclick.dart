import 'package:flutter/material.dart';
import 'package:untitled2/model/Data.dart';

class ImageMaterialDetailScreen extends StatelessWidget {
  const ImageMaterialDetailScreen({Key? key, required this.material}) : super(key: key);

  final   material;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(material.title?? ''),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Image.network(material.url?? " "),
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