import 'package:flutter/material.dart';
import 'package:untitled2/ui/editingAccount/editAccount.dart';

import 'package:untitled2/ui/widgets/customButton.dart';

import 'Notification.dart';
import 'Suggestion & Complaints.dart';

class Settings extends StatelessWidget {
  static const String routeName = 'Settings';

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
          children: [
            SizedBox(height: 40,),
               Card(
                color: Color(0xffFEF1F0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('asstes/images/profile.png'),
                          ),
                          Column(
                            children: [
                              SizedBox(height: 16),
                              Text(
                                'Amira Mahmoud',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'amiramahmoud@gmail.com',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '556790',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
SizedBox(width: 15,),
IconButton(onPressed:(){
  Navigator.pushReplacementNamed(context, editAccount.routName);

}, icon:    Icon(Icons.arrow_forward_ios),
)   ,                   ],
                      ),
                    ],
                  ),
                ),
              ),

            SizedBox(height: 40,),
            CustomButton3(Icons.notifications_rounded,'Notifications' , (){
              Navigator.pushReplacementNamed(context, Notifications.routeName);

            },),
            SizedBox(height: 10,),
            CustomButton3( Icons.settings_suggest,'Suggestions & Complaints', (){
              Navigator.pushReplacementNamed(context, SuggestionAndComplaints.routeName);

            }),
            SizedBox(height: 10,),
            CustomButton3(Icons.dark_mode,'Dark Mode',(){} ),
            SizedBox(height: 10,),
            CustomButton3(Icons.sort_by_alpha,'Langauge ', (){}),
            SizedBox(height: 10,),
            CustomButton3( Icons.headset_mic_outlined,'Get Help',(){}),
            SizedBox(height: 10,),
            CustomButton3(Icons.help,'About App',(){}),
            SizedBox(height: 70,),
            CustomButton('Sign Out',(){}),




          ],
        ),
      ),
    );
  }
}

