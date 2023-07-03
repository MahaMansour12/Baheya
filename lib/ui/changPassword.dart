

import 'package:flutter/material.dart';
import 'package:untitled2/ui/editingAccount/editAccount.dart';
import 'package:untitled2/ui/widgets/customForm.dart';

import '../remot/Api_petion_information/API_PatientInformation.dart';

class UPdataPassword extends StatelessWidget {
  static const String routName = 'UPdataPassword';
  TextEditingController password = TextEditingController();
  TextEditingController Oldpassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context,editAccount.routName);
            },
            child: const Icon(Icons.arrow_back_ios_new_outlined,
                color: Colors.black, size: 25)),
        title: Text('Change Password',
      ),),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
         //   mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              customForm('old password',Icon(Icons.password), controller:Oldpassword,
                keyboard: TextInputType.visiblePassword,
                obscure: false,

              ),
              const SizedBox(
                height: 30,
              ),
              customForm('New Password',Icon(Icons.password), controller:password,
                keyboard: TextInputType.visiblePassword,
                obscure: false,

              ), const SizedBox(
                height: 25,
              ),
              customForm('confirm Password',Icon(Icons.confirmation_number_outlined), controller:confirmPassword,
                keyboard: TextInputType.visiblePassword,
                obscure: false,

              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: (){
                  UPData.sendUPData(data: {
                    "oldPassword":Oldpassword.text,
                    "newPassword":password.text,
                    "confirmPassword":confirmPassword.text

                  }, endpoint: 'UpdatePassword');
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}