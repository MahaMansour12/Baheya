import 'package:flutter/material.dart';
import 'package:untitled2/ui/home/home.dart';

import '../widgets/customForm.dart';
import '../widgets/customWidget.dart';

class editAccount extends StatefulWidget {
  static const String routName = 'editAccount';

  @override
  State<editAccount> createState() => _editAccountState();
}

class _editAccountState extends State<editAccount> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController userName = TextEditingController();

  TextEditingController medicalId = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  int selectedInsex=0;

  bool isSlec=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile',
              style: TextStyle(color: Colors.black, fontSize: 18)),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, home_screen.routName);
              },
              child: const Icon(Icons.arrow_back_ios_new_outlined,
                  color: Colors.black, size: 25)),
        ),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  //
                  Stack(
                    children: [
                      Card(
                        elevation: 10,
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              color: const Color(0x51f8aca2),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Positioned(
                        top: 10,left: 100,
                          child: Image(
                            image: AssetImage(
                              'asstes/images/avatar.png',
                            ),
                            width: MediaQuery.of(context).size.width * 0.4,
                           // height: MediaQuery.of(context).size.height * 0.4,
                          ),
                        ),
                    ],
                  ),


                      const SizedBox(
                        height: 25,
                      ),
                     customForm('Name',Icon(Icons.account_circle), controller:userName,
                          keyboard: TextInputType.name,
                          obscure: false,

                        ),
                      const SizedBox(
                        height: 25,
                      ),
                       customForm('Email',Icon(Icons.email_outlined), controller:email,
                          keyboard: TextInputType.emailAddress,
                          obscure: false,

                        ), const SizedBox(
                        height: 25,
                      ),
                       customForm(' New Password',Icon(Icons.lock_outline), controller:userName,
                        keyboard: TextInputType.visiblePassword,
                        obscure: false,


                      ), const SizedBox(
                        height: 25,
                      ),
                    customForm('Medical ID',Icon(Icons.perm_identity), controller:userName,
                        keyboard: TextInputType.name,
                        obscure: false,

                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        'Stage',
                        textAlign: TextAlign.left,
                        style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      DefaultTabController(length: 5, child:TabBar(
                        isScrollable: true,
                        onTap: (index){
                          selectedInsex=index;
                          isSlec=true;
                          setState(() {

                          });

                        },
                        tabs: [
                        StageTap(text:"chemotherapy", isSelected:isSlec),
                          StageTap(text:"surgery", isSelected:isSlec),
                          StageTap(text:"hormonaltherapy", isSelected:isSlec),
                          StageTap(text:"radiotherapy", isSelected:isSlec),
                          StageTap(text:"targetedtherapy", isSelected:isSlec),
                      ],
                      indicatorColor: Colors.transparent,)
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        height: 60,
                        width: 300,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            color: const Color(0xfff8aca2),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          'Update',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 19),
                        ),
                      ),

                ]),
              ),
            )));
  }
}
