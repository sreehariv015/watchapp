import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchapp/view/auth_ui/phone_number_page.dart';
import 'package:watchapp/view/auth_ui/sign_up_page.dart';

import '../../controller/google_signin_controller.dart';
import 'sign_in_page.dart';

class WelcomeScreen1 extends StatefulWidget {
  const WelcomeScreen1({super.key});

  @override
  State<WelcomeScreen1> createState() => _WelcomeScreen1State();
}

class _WelcomeScreen1State extends State<WelcomeScreen1> {
  final loginkey=GlobalKey<FormState>();
  GoogleSignInController googleSignInController=GoogleSignInController();

  @override
  Widget build(BuildContext context) {
    Size halfwidth = MediaQuery.of(context).size / 2;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: loginkey,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 25),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 320,
                      width: 550,
                      child: Stack(
                        children: [
                          Center(
                            child: Image(
                                image: AssetImage(
                                  'assets/images/pic.webp',
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Text("WELCOME!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 60,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text("Our watches that match your standard",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 170,),
              Container(
                alignment: Alignment.center,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const Login11();
                              }),
                            );
                          },
                          child: const Text(
                            "Sign in",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Text("Or",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500
                      ),),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const LoginPage24();
                              }),
                            );
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100,),
              const Text("Or continue with",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: IconButton(onPressed: () {
                      setState(() {
                        googleSignInController.signInWithGoogle();
                      });
                    }, icon:const Image(image: AssetImage('assets/images/google.png'))),
                  ),
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: IconButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const MobileNumber1();
                      },));
                    }, icon:const Image(image: AssetImage('assets/images/phone.png'))),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
