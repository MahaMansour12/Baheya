import 'package:flutter/material.dart';
import 'package:untitled2/model/Data.dart';
import 'package:untitled2/shared/sharedPeferences.dart';
import 'package:untitled2/ui/home/home.dart';
import 'package:untitled2/ui/otherStage/otherStage.dart';

class ImageMaterialDetailScreen extends StatelessWidget {
  const ImageMaterialDetailScreen({Key? key, required this.material}) : super(key: key);

  final   material;

  @override
  Widget build(BuildContext context) {
    String? imageUrl = material.url;
    return Scaffold( appBar: AppBar(
      title: Text(material.title?? " ",style: TextStyle(color: Colors.black, fontSize: 18)),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context,otherStage.routeName);
          },
          child: const Icon(Icons.arrow_back_ios_new_outlined,
              color: Colors.black, size: 25)),
    ) ,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(

          child: SingleChildScrollView(
            child: Center(
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(material.description??' ', style: TextStyle(fontSize: 18),textAlign: TextAlign.center),
                  SizedBox(height: 8),
                  //Text(material.stage??' ', style: TextStyle(fontSize: 18),textAlign: TextAlign.center),
                  SizedBox(height: 8),
                  imageUrl != null
                      ? Image.network(
                    imageUrl,

                    fit: BoxFit.cover,
                  )
                      : Container()
,                  SizedBox(height: 16),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}