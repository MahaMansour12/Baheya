import 'package:flutter/material.dart';
import 'package:untitled2/ui/sign_in.dart';

import '../customWidget.dart';

class Register extends StatelessWidget {
  static const String routName = 'Register';
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController medicalId = TextEditingController();

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
                  height: MediaQuery.of(context).size.height * 0.35,
                  fit: BoxFit.fill,
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
                      controller: password,
                      decoration: const InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.visibility_off_sharp),
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    StageTap(text: 'Stage I',),
                    StageTap(text: 'Stage II',),
                    StageTap(text: 'Stage III',),
                    StageTap(text: 'Stage IV',),
                  ],),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
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
              height: 15,
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
