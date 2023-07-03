
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/ui/sign_in.dart';
class ScreenOne extends StatelessWidget {
  static const String routeName = 'ScreenOne';
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
                              .height * .60,
                          fit: BoxFit.fill,
                        ),

                        const Positioned(
                          left: 18,
                          top: 130,
                          child: Text(
                            'Welcome to Baheya',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height:300 ,),
                        const Positioned(
                          left: 15,
                          top: 340,
                          child: Text(
                            '''
Baheya, standing back to 
back with all Egyptian women
                            ''',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 100,),
                        const Positioned(
                          left: 15,
                          top: 420,
                          child: Text(
                            '''
 Baheya’s story has started when Mrs. Baheya Wahby, a 
 lady from a prominent Egyptian family, was diagnosed 
 with cancer back in 1990s. Because she went through
 the same experience she felt for the fighters and 
 especially the less privileged women.
                            ''',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        )

                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text('Or login with',style: TextStyle(fontSize: 18),),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                           // googleConnect();
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
                    SizedBox(height: 70,),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center
                    ,children: [
                      Text('Already have an account?'),
                      TextButton(onPressed: (){
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Sign_IN()),
                        );
                      }, child: Text('Signin',style: TextStyle(
                        color: Color(0xffF79489)
                      ),))
                    ],),



                  ])
          )

      );
  }






}

