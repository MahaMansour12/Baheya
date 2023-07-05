import 'package:flutter/material.dart';
import 'package:untitled2/ui/home/tnm.dart';

class ArticleScreen extends StatelessWidget {
  final Article article;

  ArticleScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title,style: TextStyle(color: Colors.black54)),backgroundColor: Colors.transparent,
        elevation: 0,

        leading: InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context,tnm.routName);
            },
            child: const Icon(Icons.arrow_back_ios_new_outlined,
                color: Colors.black, size: 25)),
      ),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(article.content,style: TextStyle(fontSize: 18)),
      ),
    );
  }
}