import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/shared/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled2/ui/home/home.dart';
import 'package:untitled2/ui/register.dart';

import '../remot/network/dio_helper.dart';

class Sign_IN extends StatelessWidget {
  static const String routeName = 'sign_in';
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Image(
                    image: AssetImage("asstes/images/appbBar.png"),
                    width: double.infinity,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.35,
                    fit: BoxFit.fill,
                  ),
                  const Positioned(
                    left: 15,
                    top: 150,
                    child: Text(
                      'Sign in to Your',
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
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            color: Color(0x51f8aca2),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: email,
                          decoration: const InputDecoration(
                              border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                              prefixIcon: Icon(Icons.email),
                              hintText: 'Email'),
                          validator: (value) {
                            if (value == null || value
                                .trim()
                                .isEmpty) {
                              return 'Enter phone Email';
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            color: Color(0x51f8aca2),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                            controller: password,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                prefixIcon: Icon(Icons.lock),
                                hintText: 'password'),
                            validator: (pass) {
                              if (pass?.trim() == "") {
                                return "Please enter password";
                              }
                            }),
                      ),
                      SizedBox(
                        height: 40,
                      ),

                         InkWell(
                           onTap: (){
                                ApiLink({
                                  "email":email.text,
                                  "password":password.text
                                },'login').then((value) {

                                  if(value.statusCode==200){
                                    print(value.body);
                                    Navigator.pushNamed(context, home_screen.routName,arguments: value.body);
                                  }else{
                                    if(formKey.currentState!.validate()==false){
                                      return;
                                    }

                                  }

                                }
                                );

                           },
                           child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            height: 50,
                            width: 300,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1, color: Colors.grey),
                                color: Color(0xfff8aca2),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              'Login',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                        ),
    ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.35,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                        )),
                    Text(
                      ' OR ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Container(
                        height: 1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.35,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      googleConnect();
                    },
                    child: Container(
                        width: 35,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child:
                        Image(image: AssetImage('asstes/images/google.jpg'))),
                  ),
                  Text('Google'),
                  SizedBox(
                    width: 40,
                  ),
                  InkWell(
                    onTap: () {
                      //facebookConnect();
                    },
                    child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: const Image(
                            image: AssetImage('asstes/images/facebook.jpg'))),
                  ),
                  const Text('Facebook')
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account ?   ",
                    style: TextStyle(fontSize: 17, color: Colors.grey),
                  ),
                  InkWell(
                    child: const Text(
                      'Register ',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.indigo,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, Register.routName);
                    },
                  )
                ],
              )
            ],
          ),
        ),
    )
    ])
        )

      );
  }


  void googleConnect() async {
    Future<UserCredential> signInWithGoogle() async {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
    // }
    //
    // void facebookConnect() {
    //
    //   Future<UserCredential> signInWithFacebook() async {
    //     // Trigger the sign-in flow
    //     final LoginResult loginResult = await FacebookAuth.instance.login();
    //
    //     // Create a credential from the access token
    //     final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken.token);
    //
    //     // Once signed in, return the UserCredential
    //     return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    //   }
  }



}

