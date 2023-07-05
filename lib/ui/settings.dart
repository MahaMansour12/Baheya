import 'package:flutter/material.dart';
import 'package:untitled2/ui/editingAccount/editAccount.dart';
import 'package:untitled2/ui/home/awerence/awareness%20.dart';

import 'package:untitled2/ui/widgets/customButton.dart';

import '../remot/Api_petion_information/API_PatientInformation.dart';
import '../remot/Api_petion_information/PationInformation.dart';
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
              Navigator.pushReplacementNamed(context, awareness.routName);
            },
            child: const Icon(Icons.arrow_back_ios_new_outlined,
                color: Colors.black, size: 25)),
        // actions: [
        //   Icon(Icons.dark_mode_outlined, color: Colors.black, size: 25),
        //   SizedBox(
        //     width: 10,
        //   ),
        //   Icon(Icons.notifications_none_rounded, color: Colors.black, size: 25),
        //   SizedBox(
        //     width: 10,
        //   ),
        //   InkWell(
        //       onTap: () {
        //         Navigator.pushReplacementNamed(context, Settings.routeName);
        //       },
        //       child:
        //       Icon(Icons.settings_outlined, color: Colors.black, size: 25)),
        //   SizedBox(
        //     width: 10,
        //   ),
        // ],
      ),

      body: FutureBuilder<PatientInformation>(

          future:Information.InformationPatient(),
          builder: (context, snapshot) {

        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40,),
                 Card(
                  color: Color(0xffFEF1F0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 43,
                              backgroundImage: AssetImage('asstes/images/avatar.png'),
                            ),
                            SizedBox(width: 16),
                            Column(
                              children: [

                                SizedBox(height: 16),
                                Text(
                                  snapshot.data?.name?.substring(0,15)??'',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  snapshot.data?.email??'',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  snapshot.data?.medicalNumber??'',
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
         );}
      ),
    );
  }
}

