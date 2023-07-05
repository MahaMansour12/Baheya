import 'package:flutter/material.dart';
import 'package:untitled2/ui/settings.dart';


class About extends StatelessWidget {
  static const String routeName = 'About';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('مستشفى بهية', style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Color(
                  0xff917272)),),
SizedBox(height: 15,),
              Text('''             بدأت قصة بهية بعد اصابة السيدة بهية وهبي
            زوجة المهندس \ حسين أحمد عثمان بسرطان الثدي
              ، وخلال العلاج لاحظت معاناة 
              السيدات الفقيرة في محاربة 
              المرض وكانت تتمنى أن توفر جهاز
               إشعاع للمرضى، وهو الآن في بهية
               كأحدث جهاز إشعاعي في الشرق الأوسط. 
              ولم يكتفوا بإحضار الجهاز فقط
              ، وتحول منزلها الخاص لمركز متخصص في 
              علاج سرطان الثدي بالمجان لكل سيدات مصر.
               قد تأسس مركز بهية للإكتشاف المبكر
               وعلاج سرطان الثدي عام 
              2015، ويتكون من 6 أدوار،
               وأجهزة بقيمة 150 مليون جنيه.

''',textAlign: TextAlign.center),
              SizedBox(height: 20,),
              Text('رؤيتنا',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
              Text('مؤسسة بهية هي المقصد الأول لصحة وسلامة المرأة',textAlign: TextAlign.center),
              SizedBox(height: 20,),
              Text('رسالتنا',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
              Text('مؤسسة تقدم برامج مبتكرة متخصصة في التوعية والكشف المبكر وعلاج سرطان الثدي والدعم النفسي للمرأة بإستخدام أحدث التقنيات',textAlign: TextAlign.center),
              SizedBox(height: 20,),
              Text('هدفنا',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
              Text('نطمن كل ست في مصر'),
              SizedBox(height: 20,),

              Text('ما يميز بهية',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color(
              0xff917272)) ,),
              SizedBox(height: 20,),
              Text('الكشف المبكر',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
              Text('لكشف المبكر عن سرطان الثدى دور كبير فى إرتفاع نسب الشفاء حيث تصل لأكثر من 98% لذا يعد من أهم الدعائم التى نرتكز عليها، حيث تعمل مؤسسة بهية بشكل دائم على زيادة التوعية بسرطان الثدي لدى السيدات فى مختلف الفئات والأعمار.',textAlign: TextAlign.center),
              SizedBox(height: 20,),
              Text('الدعم النفسي',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
              Text('هدفنا الرئيسي هو تقديم الدعم لمحاربات بهية، ويشمل الدعم النفسي والرعاية والتوجيه والعمل على مشاركة المريضة خلال رحلتها في بهية؛ وذلك بمشاركتهن في أنشطة وورش عمل تشمل الرسم، المشغولات اليدوية، جلسات الدعم النفسي مع مدربين متخصصين'),
              SizedBox(height: 20,),
              Text('التوعية',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
              Text('انطلاقًا من إهتمام مؤسسة بهية بضرورة رفع الوعى لدى السيدات بأهمية الكشف المبكر عن سرطان الثدي؛ تنظم مؤسسة بهية العديد من ندوات التوعية الخارجية على مدار العام بهدف تغطية جميع المحافظات'),










            ],
          ),
        ),
      ),

    );
  }
}
