import 'package:flutter/material.dart';
import 'package:untitled2/remot/Api_petion_information/API_PatientInformation.dart';
import 'package:untitled2/ui/changPassword.dart';
import 'package:untitled2/ui/home/home.dart';

import '../widgets/customForm.dart';
import '../widgets/customWidget.dart';

class editAccount extends StatefulWidget {
  static const String routName = 'editAccount';

  @override
  State<editAccount> createState() => _editAccountState();
}

class _editAccountState extends State<editAccount> {
  final List<String> options = ['chemotherapy', 'surgery', 'hormonaltherapy', 'radiotherapy', 'targetedtherapy'];
  String? selectedOption;
  TextEditingController email = TextEditingController();


  TextEditingController userName = TextEditingController();

  TextEditingController phone = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();


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
                      customForm('phone',Icon(Icons.phone), controller:userName,
                        keyboard: TextInputType.name,
                        obscure: false,


                      ), const SizedBox(
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
                      DropdownButton (
                        hint:const Text('Update your Stage',style:  TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                        value: selectedOption,
                        items: options
                            .map((option) => DropdownMenuItem(
                          child: Text(option),
                          value: option,
                        ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value  as String?;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      InkWell(
                        onTap: (){
                          UPData.sendUPData(data: {
                            'chosenStage':selectedOption,
                            'name':userName.text,
                            'phone':phone.text

                          }, endpoint: 'UpdatePatientInformation');

                        },
                        child: Container(
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
                      ),const SizedBox(
                        height: 10,
                      ),

                      InkWell(
                          onTap: (){
                            Navigator.pushReplacementNamed(context,UPdataPassword.routName );

                          },
                          child: const SizedBox(height: 100,width: 300,child: Text('Change Your Password'),)),

                ]),
              ),
            )));
  }
}
