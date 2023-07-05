import 'package:flutter/material.dart';
import 'package:untitled2/ui/settings.dart';
class GetHelp extends StatelessWidget {
  static const String routeName = 'GetHelp';

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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Text('للتواصل مع مستشفى بهية', style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Color(
                    0xff917272)),),
                SizedBox(height: 15,),
                SizedBox(height: 20,),
                Text('  الأرقام الخاصه بقسم الدعم النفسي للتواصل من 9 صباحاً حتى 5 مساءاً ماعدا الجمعه  ',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                Text('''
                
  +201103200958

  +201064052444

  +201064108444

  +201154105556

  +201111957865
  (للإنضمام لجروب الواتس برجاء إرسال رساله على احد الأرقام السابقه)
                ''',textAlign: TextAlign.center),
                SizedBox(height: 20,),
                Text('للتواصل مع بهية',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                Text('    اتصل بنا على 16602 يصلك مندوبنا اينما كنت يوميا من الساعه التاسعه صباحا وحتى العاشرة مساءً طوال ايام الاسبوع، وفي رمضان من التاسعه صباحا حتي الثانيه مساءً'),
                SizedBox(height: 20,),
                Text('العنوان',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                Text('4 شارع علوبة أول شارع الهرم بجوار داري , الجيزة , مصر'),
                SizedBox(height: 20,),
                Text('الايميل',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                Text('baheya@baheya.org'),
                SizedBox(height: 20,),
                Text('للتبرع لمستشفى بهية',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color(
                    0xff917272)) ,),
                SizedBox(height: 20,),
Image(image: AssetImage('asstes/images/8.jpeg'))      ],
            ),
          ),
        ),
      ),
    );
  }
}
