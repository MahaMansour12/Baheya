import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/ui/sign_in.dart';
import 'package:untitled2/ui/home/home.dart';
import '../remot/network/dio_helper.dart';
import 'widgets/customWidget.dart';

class Register extends StatefulWidget {
  static const String routName = 'Register';


  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController email = TextEditingController();

  TextEditingController phone = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController userName = TextEditingController();

  TextEditingController medicalId = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();
  String selectedText = '';
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Image(
                  image: const AssetImage("asstes/images/appbBar.png"),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  top: 30,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, Sign_IN.routeName);
                    },
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Positioned(
                  left: 15,
                  top: 150,
                  child: Text(
                    'Register to Your',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Positioned(
                  left: 15,
                  top: 200,
                  child: Text(
                    'Account',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          color: const Color(0x51f8aca2),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: userName,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Enter name';
                          }
                        },
                        decoration: const InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            prefixIcon: Icon(Icons.person_pin),
                            hintText: 'User Name'),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          color: const Color(0x51f8aca2),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: email,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Enter your email';
                          }
                        },
                        decoration: const InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            prefixIcon: Icon(Icons.email),
                            hintText: 'Email'),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          color: const Color(0x51f8aca2),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: phone,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Enter your phone';
                          }
                        },
                        decoration: const InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            prefixIcon: Icon(Icons.phone),
                            hintText: 'Phone'),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          color: const Color(0x51f8aca2),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Enter password';
                          }
                        },
                        controller: password,
                        decoration: const InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            prefixIcon: Icon(Icons.lock),
                            hintText: 'password'),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          color: const Color(0x51f8aca2),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: medicalId,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Enter your medical id';
                          }
                        },
                        decoration: const InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            prefixIcon: Icon(Icons.perm_identity_sharp),
                            hintText: 'Medical ID'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Stage',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    //mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                    Row(
                      children: [
                      GestureDetector(
                        onTap: (){


                          setState(() {
                            selectedText='chemotherapy';
                          });
                        },
                        child: StageTap(text:'chemotherapy' ),

                      ),

                      GestureDetector(
                        onTap: (){


                          setState(() {
                            selectedText='surgery';
                          });
                        },
                        child: StageTap(text:'surgery' ),

                      ),



                    ],),
                    Row(children: [
                      GestureDetector(
                        onTap: (){


                          setState(() {
                            selectedText='hormonaltherapy';
                          });
                        },
                        child: StageTap(text:'hormonaltherapy' ),

                      ),
                      GestureDetector(
                        onTap: (){


                          setState(() {
                            selectedText='targetedtherapy';
                          });
                        },
                        child: StageTap(text:'targetedtherapy ' ),

                      ),
                    ],),
                      GestureDetector(
                        onTap: (){


                          setState(() {
                            selectedText='radiotherapy';
                          });
                        },
                        child: StageTap(text:'radiotherapy' ),

                      ),
                  ],),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        ApiLink({

                            "name":userName.text,
                            "email":email.text,
                            "phone":phone.text,
                            "medicalNumber":medicalId.text,
                            "password":password.text,
                            "chosenStage":selectedText

                        }, 'register')
                            .then((value) {
                          if (value.statusCode == 200) {
                            Navigator.pushReplacementNamed(
                                context, home_screen.routName);
                          } else {
                            print(value.body);
                            if (formKey.currentState!.validate() == false) {
                              return;
                            }
                          }
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            color: const Color(0xfff8aca2),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          'Sign Up',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width * 0.35,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                      )),
                  const Text(
                    ' OR ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width * 0.35,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?  ",
                  style: TextStyle(fontSize: 17, color: Colors.grey),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Sign_IN.routeName);
                  },
                  child: const Text('Sign in ',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.indigo,
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
