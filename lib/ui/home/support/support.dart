import 'package:flutter/material.dart';
import 'package:untitled2/ui/home/home.dart';

import '../../Notification (1).dart';
import '../../book a service.dart';
import '../../settings.dart';

class support extends StatelessWidget {
  static const String routName='support';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, home_screen.routName);
            },
            child: const Icon(Icons.arrow_back_ios_new_outlined,
                color: Colors.black, size: 25)),
        actions: [
          Icon(Icons.dark_mode_outlined, color: Colors.black, size: 25),
          SizedBox(
            width: 10,
          ),
          InkWell(
              onTap: (){
                Navigator.pushReplacementNamed(context,Notifications.routeName);
              },
              child: Icon(Icons.notifications_none_rounded, color: Colors.black, size: 25)),
          SizedBox(
            width: 10,
          ),
          InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, Settings.routeName);
              },
              child:
              Icon(Icons.settings_outlined, color: Colors.black, size: 25)),
          SizedBox(
            width: 10,
          ),
        ],
      ),
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

    ),



          buildCard(
              title: 'Eradication Of Illiteracy', image: AssetImage('asstes/images/1.jpeg')),
          buildCard(
              title: 'Mental Health Support Sessions', image: AssetImage('asstes/images/6.jpeg')),
          buildCard(
              title: 'Individual Support', image: AssetImage('asstes/images/4.jpeg')),
          buildCard(
              title: 'Parties/Birthdays', image: AssetImage('asstes/images/5.jpeg')),
          buildCard(
              title: 'gifts', image: AssetImage('asstes/images/7.jpeg')),
          buildCard(
              title: 'trips', image: AssetImage('asstes/images/3.jpeg')),
          buildCard(
              title: 'Vocational Training Workshop', image: AssetImage('asstes/images/2.jpeg')),
    ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, BookAService.routeName);

            },
            child: Text('Book a service',style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              primary: Color(0xfaf8aca2), // background
              onPrimary: Colors.white,
              fixedSize: Size(130, 80),

              // foreground
            ),)

        ]))    ),

    );
  }
}


buildCard({required String title, required AssetImage image}) {
  return Card(
    child: Column(
      children: [

        Image(
          image: image,
          fit: BoxFit.cover,
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    ),
  );
}
