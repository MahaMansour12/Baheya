import 'package:flutter/material.dart';
import 'package:untitled2/ui/home/home.dart';

class support extends StatelessWidget {
  static const String routName='support';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:   Padding(
        padding: const EdgeInsets.all(12),
    child: SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    Text(
    'Hello ...',
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    textAlign: TextAlign.start,
    ),
    Text(
    'We hope you become better soon',
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    ),
    const SizedBox(
    height: 20,
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
    padding: const EdgeInsets.all(10),
    height: 40,
    width: double.infinity,
    decoration: BoxDecoration(
    border: Border.all(width: 1, color: Color(0xfff8aca2)),
    color: Colors.white,
    borderRadius: BorderRadius.circular(40)),
    child: TextFormField(
    decoration: InputDecoration(
    prefixIcon:
    Icon(Icons.search, color: Color(0xfff8aca2)),
    border: OutlineInputBorder(borderSide: BorderSide.none),
    ),
    )),
    )]))    ),

    );
  }
}
