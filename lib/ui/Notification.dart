import 'package:flutter/material.dart';
import 'package:untitled2/ui/settings.dart';

import 'customButton.dart';

class Notifications extends StatelessWidget {
  static const String routeName = 'Notifications';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, Settings.routeName);
            },
            child: const Icon(Icons.arrow_back_ios_new_outlined,
                color: Colors.black, size: 25)),
        actions: [
          Icon(Icons.dark_mode_outlined, color: Colors.black, size: 25),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.notifications_none_rounded, color: Colors.black, size: 25),
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

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.notifications_rounded, size:48 ,),
            SizedBox(height: 15),
            Text('''  Turn on
  Notifications''',style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
            SizedBox(height: 30),
            Text('''  Don’t miss important messages like
  Medicine Time and new Events'''),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment:MainAxisAlignment.center ,
              children: [
                Text('''  Get edit on your dose or stage
  Availability of Support and More
'''),

              ],
            ),
            SizedBox(height: 50),
            CustomButton('Yes, notify me ',(){}),
            SizedBox(height: 72),
            CustomButton2('Skip'),
          ],
        ),
      ),
    );
  }
}
