import 'package:flutter/material.dart';
import 'package:watchapp/screens/loginpage.dart';
import 'package:watchapp/screens/phone_number_page.dart';
import 'package:watchapp/screens/registrationpage.dart';
import 'controller/google_signin_controller.dart';
class FrontPage1 extends StatefulWidget {
  const FrontPage1({super.key});

  @override
  State<FrontPage1> createState() => _FrontPage1State();
}

class _FrontPage1State extends State<FrontPage1> {
  final loginkey=GlobalKey<FormState>();
  GoogleSignInController googleSignInController=GoogleSignInController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: loginkey,
          child: Column(
            children: [
              const SizedBox(height: 50,),
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
                padding: EdgeInsets.all(8.0),
                child: Text("Our watches that match your standard",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 200,),
              Container(
                alignment: Alignment.center,
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Container(
                    decoration: BoxDecoration(
                        color:Colors.black,
                        borderRadius: BorderRadius.circular(5)

                    ),
                    width: 180,
                    height: 50,
                    child: TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const Login11();
                      },));

                    }, child: const Text("Sign in",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 23
                      ),)),
                  ),
                  const SizedBox(width: 30,
                  child: Text("Or",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22
                    ),
                  )),
                  SizedBox(
                    child: Container(
                      decoration: BoxDecoration(
                          color:Colors.red,
                          borderRadius: BorderRadius.circular(5)

                      ),
                      width: 180,
                      height: 50,
                      child: TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const LoginPage24();
                        },));

                      }, child: const Text("Register",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 23
                        ),)),
                    ),

                  ),
                ]),
              ),
              const SizedBox(height: 75,),
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
