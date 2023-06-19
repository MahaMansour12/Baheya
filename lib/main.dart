import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/ui/home/home.dart';
import 'package:untitled2/ui/register.dart';
import 'package:untitled2/ui/sign_in.dart';
import 'firebase_options.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(bahya());
}
class bahya extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
        home_screen.routName:(context)=>home_screen(),
        Sign_IN.routeName:(context)=>Sign_IN(),
        Register.routName:(context)=>Register(),

      } ,
      initialRoute:Sign_IN.routeName ,


    );
  }
}

