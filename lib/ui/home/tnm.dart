

import 'package:flutter/material.dart';
import 'package:untitled2/ui/home/home.dart';

import 'articalScreen.dart';
class Article {
  final String title;
  final String content;

  Article({required this.title, required this.content});
}

final List<Article> articles = [
  Article(
      title: 'TNM Staging for Breast Cancer: An Overview',
      content:"Stage I breast cancer is an early stage of breast cancer in which the tumor is small and has not spread beyond the breast. In stage I, the tumor is no more than 2 centimeters in diameter and has not spread to the lymph nodes or other parts of the body.\n\nTreatment for stage I breast cancer typically involves surgery to remove the tumor, followed by radiation therapy to kill any remaining cancer cells. In some cases, chemotherapy or hormone therapy may also be recommended.\n\nThe prognosis for stage I breast cancer is generally very good, with a five-year survival rate of around 90 percent. However, it's important to continue with regular follow-up appointments and screenings to detect any potential recurrence or new cancers."),
  Article(
      title: 'Stage I Breast Cancer',
      content:   "Stage I breast cancer is an early stage of breast cancer in which the tumor is small and has not spread beyond the breast. In stage I, the tumor is no more than 2 centimeters in diameter and has not spread to the lymph nodes or other parts of the body.\n\nTreatment for stage I breast cancer typically involves surgery to remove the tumor, followed by radiation therapy to kill any remaining cancer cells. In some cases, chemotherapy or hormone therapy may also be recommended.\n\nThe prognosis for stage I breast cancer is generally very good, with a five-year survival rate of around 90 percent. However, it's important to continue with regular follow-up appointments and screenings to detect any potential recurrence or new cancers. "),
  Article(
      title: 'Stage II Breast Cancer',
      content:
      "Stage II breast cancer is an early but slightly more advanced stage of breast cancer than stage I. In stage II, the tumor is larger than in stage I, and may have spread to nearby lymph nodes but has not spread to other parts of the body.\n\nTreatment for stage II breast cancer typically involves surgery to remove the tumor, followed by radiation therapy to kill any remaining cancer cells. Chemotherapy and hormone therapy may also be recommended, depending on the characteristics of the tumor and other individual factors.\n\nThe prognosis for stage II breast cancer depends on several factors, including the size and characteristics of the tumor, the number of lymph nodes involved, and the age and overall health of the patient. The five-year survival rate for stage II breast cancer is generally around 80 percent, but this can vary widely depending on individual circumstances. "),
  Article(
      title: 'Stage III Breast Cancer',
      content:" Stage III breast cancer is divided into three subcategories: IIIA, IIIB, and IIIC. The specific characteristics of each subcategory are as follows: \n IIIA: The tumor is larger than 5 centimeters and has spread to between 1 and 9 nearby lymph nodes or to lymph nodes near the breastbonen IIIB: The tumor has grown into the chest wall or skin of the breast and may have spread to up to 9 nearby lymph nodes. IIIC: The tumor has spread to 10 or more nearby lymph nodes or to lymph nodes above or below the collarbone. "),
  Article(
      title: 'Stage IV Breast Cancer',
      content:
     " Breast cancer is a serious condition that affects millions of women every year. Stage IV breast cancer is an advanced form of the disease that has spread to other parts of the body, such as the bones, liver, lungs, or brain. In this article, we will discuss the characteristics of Stage IV breast cancer, including its symptoms, diagnosis, and treatment options."),
];


class tnm extends StatelessWidget {
  static const String routName='tnm';

  const tnm({Key? key}) : super(key: key);
@override
Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('TNM Staging for Breast Cancer',style: TextStyle(color: Colors.black, fontSize: 18)),
        centerTitle: true,
         backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context,home_screen.routName);
            },
            child: const Icon(Icons.arrow_back_ios_new_outlined,
                color: Colors.black, size: 25)),
      ) ,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'The TNM staging system is used to describe the extent of a breast cancer tumor, as well as the involvement of nearby lymph nodes and the presence of distant metastases. The system uses three parameters:',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 10.0),
              Text(
                '- T (tumor) describes the size of the primary tumor and whether it has invaded nearby tissue.',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '- N (node) describes the involvement of nearby lymph nodes.',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '- M (metastasis) describes the presence of distant metastases.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 10.0),
              Text(
                'The TNM system combines these parameters into stages ranging from 0 to IV:',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 10.0),
              Text(
                '- Stage 0 (also called carcinoma in situ) refers to non-invasive breast cancer.',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '- Stage I refers to small, localized tumors that haven\'t spread to nearby lymph nodes.',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '- Stage II refers to tumors that are larger or have spread to nearby lymph nodes.',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '- Stage III refers to locally advanced tumors that may have spread to nearby tissues or lymph nodes.',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '- Stage IV refers to tumors that have spread to distant organs, such as the lungs, liver, or bones.',
                style: TextStyle(fontSize: 16.0),

  ), Container(
                  height: 400,
                  width: 200, // set a fixed height for the ListView


                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: articles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: ListTile(
                          title: Text(articles[index].title,textAlign: TextAlign.center,),
                          onTap: () {
                            // Navigate to the article screen when the user taps on an article
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ArticleScreen(article: articles[index]),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  )  ),
            ],
          ),
        ),
      ),

  );
}
}