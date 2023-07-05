import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled2/ui/Notification.dart';

import 'package:untitled2/ui/home/support/support.dart';
import 'package:untitled2/ui/settings.dart';
import 'package:untitled2/ui/sign_in.dart';

import '../calender.dart';
import '../editingAccount/editAccount.dart';
import '../userData.dart';
import 'account/account.dart';
import 'awerence/awareness .dart';
import 'event/event.dart';

class home_screen extends StatefulWidget {
  static const String routName = 'home';

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  int selextindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              SystemNavigator.pop();
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

      body:Taps[selextindex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 160,

        currentIndex: selextindex,
        onTap: (index) {
          setState(() {
            selextindex = index;
          });
        },
        items: [

          const BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('asstes/images/home.png'),
                color: Colors.grey, size: 35),
            label: "Aِِِwareness ",

          ),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('asstes/images/event.png'),
                  color: Colors.grey, size: 35),
              label: "Event"),
          BottomNavigationBarItem(
              icon: FloatingActionButton(
                backgroundColor: Colors.white,
                focusElevation: 2,
                shape: const StadiumBorder(
                    side: BorderSide(color: Color(0xfff8aca2), width: 4)),
                onPressed: () {
                  Navigator.pushReplacementNamed(context,Calendar.routeName);
                },
                child: Icon(Icons.add, color: Color(0xfff8aca2), size: 30),
              ),
              label: ""),
          const BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('asstes/images/support.png'),
                  color: Colors.grey, size: 35),
              label: "Support "),
          const BottomNavigationBarItem(
              icon:
                  Icon(Icons.supervisor_account, color: Colors.grey, size: 35),
              label: "Account "),
        ],
      ),
    );
  }

  List<Widget> Taps = [
    awareness(),
    event(),
    Calendar(),
    support(),
    Account(),
  ];
}
//,