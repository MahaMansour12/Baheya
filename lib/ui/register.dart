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
  final List<String> options = ['chemotherapy', 'surgery', 'hormonaltherapy', 'radiotherapy', 'targetedtherapy'];
 String? selectedOption;

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
                  height: MediaQuery.of(context).size.height * 0.22,
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
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Positioned(
                  left: 15,
                  top: 80,
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
                  top: 130,
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
                      height: 5,
                    ),
                    const Text(
                      'Stage',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),

              DropdownButton(
                 hint:const Text('Enter your Stage',style:  TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
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
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        API.ApiLink({
                          "name": userName.text,
                          "email": email.text,
                          "phone": phone.text,
                          "medicalNumber": medicalId.text,
                          "password": password.text,
                          "chosenStage": selectedOption
                        }, 'register')
                            .then((value) async {
                          if (value.statusCode == 200 &&
                              formKey.currentState!.validate()) {
                            print(value.body);
                            Navigator.pushReplacementNamed(
                                context, home_screen.routName);

                            // SharedPreferences prefs = await SharedPreferences.getInstance();
                            // String token = prefs.setString('token',value.body) as String;

                          } else {
                            print(value.body);
                            if (formKey.currentState?.validate() == false) {
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
              height: 5,
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
              height: 5,
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
