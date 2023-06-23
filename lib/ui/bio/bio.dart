import 'package:flutter/material.dart';
import 'package:untitled2/ui/home/home.dart';

class bio extends StatelessWidget {
  static const String routeName = 'bio';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context,home_screen.routName);
              },
              child: const Icon(Icons.arrow_back_ios_new_outlined,
                  color: Colors.black, size: 25)),
        ) ,
    body: Padding(
      padding: EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Breast cancer is a type of cancer that forms in the breast tissue. \t It is the second most common cancer among women worldwide,\t after skin cancer.",style: TextStyle(fontSize: 18)),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Some basic information about breast cancer includes:",style: TextStyle(fontSize: 18)),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("1- Causes: The exact cause of breast cancer is unknown, but there are several risk factors that can increase a person's chances of developing it, including age, gender, family history, genetics, hormonal factors, and lifestyle factors such as alcohol consumption and physical inactivity.",style: TextStyle(fontSize: 18)),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("2- Symptoms: The most common symptom of breast cancer is a lump or mass in the breast. Other symptoms may include changes in the size or shape of the breast, nipple discharge, swelling or redness of the breast, and skin changes such as dimpling or puckering.",style: TextStyle(fontSize: 18)),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("3- Diagnosis: Breast cancer is usually diagnosed through a combination of physical examination, imaging tests such as mammography or ultrasound, and a biopsy to examine a sample of the tissue.",style: TextStyle(fontSize: 18)),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("4- Treatment: Treatment for breast cancer depends on several factors, including the stage and type of cancer, as well as the person's overall health. Treatment options may include surgery, radiation therapy, chemotherapy, targeted therapy, and hormone therapy.",style: TextStyle(fontSize: 18)),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("5- Prevention: While there is no sure way to prevent breast cancer, there are several things that can be done to reduce the risk, including maintaining a healthy weight, limiting alcohol consumption, being physically active, and getting regular mammograms for early detection.",style: TextStyle(fontSize: 18)),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("It's important to note that breast cancer can affect anyone, not just women. While it is much less common, men can also develop breast cancer.",style: TextStyle(fontSize: 18)),
              )

            ],
          ),
      ),
    ),
     );

  }
}
