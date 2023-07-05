import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/remot/network/dio_helper.dart';
import 'package:untitled2/shared/sharedPeferences.dart';
import 'package:untitled2/ui/Notification.dart';
import 'package:untitled2/ui/ScreenOne.dart';
import 'package:untitled2/ui/Suggestion%20&%20Complaints.dart';
import 'package:untitled2/ui/bio/bio.dart';
import 'package:untitled2/ui/calender.dart';
import 'package:untitled2/ui/changPassword.dart';

import 'package:untitled2/ui/editingAccount/editAccount.dart';
import 'package:untitled2/ui/home/account/account.dart';
import 'package:untitled2/ui/home/awerence/awareness%20.dart';
import 'package:untitled2/ui/home/event/event.dart';
import 'package:untitled2/ui/home/home.dart';
import 'package:untitled2/ui/home/support/support.dart';
import 'package:untitled2/ui/home/tnm.dart';
import 'package:untitled2/ui/otherStage/otherStage.dart';
import 'package:untitled2/ui/register.dart';
import 'package:untitled2/ui/settings.dart';
import 'package:untitled2/ui/sign_in.dart';
import 'package:untitled2/ui/splashScreen.dart';
import 'package:untitled2/ui/userData.dart';
import 'firebase_options.dart';
import 'ui/home/event/InterstedEvents.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesHelperr.init();


  String? token = await API. getToken();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,


  );
  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final String? token;
  MyApp({this.token});

  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color(0xfaf8aca2)),
          bottomNavigationBarTheme: (BottomNavigationBarThemeData(
              selectedItemColor: Color(0xfaf8aca2),
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedIconTheme: IconThemeData(
                color: Color(0xfaf8aca2),
              )))),
      routes: {
        tnm.routName: (context) => tnm(),
        home_screen.routName: (context) => home_screen(),
        Sign_IN.routeName: (context) => Sign_IN(),
      Register.routName: (context) => Register(),
        ScreenOne.routeName:(context)=>ScreenOne(),
         event.routName: (context) => event(),
        support.routName: (context) => support(),
        Account.routName: (context) => Account(),
        awareness.routName: (context) => awareness(),
        editAccount.routName:(context)=>editAccount(),
        UserData.routName:(context)=>UserData(),
        otherStage.routeName:(c)=>otherStage(),
        bio.routeName:(v)=>bio(),
        UPdataPassword.routName:(context)=>UPdataPassword(),
        Settings.routeName:(context)=>Settings(),
        Notifications.routeName:(context)=>Notifications(),
        SplashScreen.routeName:(context)=>SplashScreen(),
        SuggestionAndComplaints.routeName:(context)=>SuggestionAndComplaints(),
        SplashScreen.routeName: (context)=>SplashScreen(),
        Calendar.routeName: (context)=>Calendar(),
     //   InterstedEvents.routName:(context)=>InterstedEvents(),
      },
        initialRoute: token != null ?home_screen.routName:SplashScreen.routeName

    );

  }

}


