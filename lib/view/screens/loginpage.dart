import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:watchapp/controller/google_signin_controller.dart';
import 'package:watchapp/view/screens/phone_number_page.dart';
import 'package:watchapp/view/screens/registrationpage.dart';
import '../../controller/email_pass_controller/email-sign-in-controller.dart';
import 'forgot_password_page.dart';
import 'main_page.dart';


class Login11 extends StatefulWidget {
  const Login11({super.key});

  @override
  State<Login11> createState() => _LoginPage1State();
}

class _LoginPage1State extends State<Login11> {
  bool passwordVisible=false;
  GoogleSignInController googleSignInController=GoogleSignInController();
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  get passwordTextController => _passwordTextController;

  get emailTextController => _emailTextController;
  final EmailPassController _emailPassController =
  Get.put(EmailPassController());
  final GoogleSignInController _googleSignInController =
  Get.put(GoogleSignInController());
  Widget getTextField(
      {required String hint,
        bool obstxt = null ?? false,
        var suficons,
        required var validator,
        required var icons,
        required var controller,
        required var keyboardType}) {
    return TextFormField(
      obscureText: obstxt,
      keyboardType: keyboardType,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: suficons,
          errorStyle: const TextStyle(
            color: Colors.yellow,
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          prefixIcon: icons,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          contentPadding:
          EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          filled: true,
          fillColor: const Color(0xFFF1F4FF),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.black54,
            fontFamily: 'Roboto-Regular',
            fontSize: 15,
            height: 0,
          )),
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key:_formKey ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 25),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 180,
                        width: 300,
                        child: Stack(
                          children: [
                            Center(
                              child: Image(
                                  image: AssetImage(
                                    'assets/images/img5.png',
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text("Login here",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.red
                      ),),
                  ),
                ),
                const Text("Welcome back! Login with your credentials",
                  style:TextStyle(
                    fontWeight: FontWeight.bold
                  ) ,),
                const SizedBox(
                  width: 50,
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    decoration:
                    const InputDecoration(
                        filled: true,
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.white,)),
                        hintText: "E-mail",
                        hintStyle: TextStyle(
                          color: Colors.black
                        ),
                        prefixIcon: Icon(Icons.mail,color: Colors.black,)),
                    controller: _emailTextController,
                    validator: (value) {
                      if (value==null || value.isEmpty){
                        return "Email can't be empty";
                      }
                      if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value)) {
                        return "Enter a valid email address";
                      }
                      return null ;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    decoration:  InputDecoration(
                        filled: true,
                        fillColor: Colors.white70,
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: "Password",
                        hintStyle: const TextStyle(
                          color: Colors.black
                        ),
                        prefixIcon: const Icon(Icons.lock,color: Colors.black,),
                        suffixIcon: IconButton(onPressed: () {
                          setState(() {
                            passwordVisible=!passwordVisible;
                          });
                        }, icon: Icon(passwordVisible?Icons.visibility:Icons.visibility_off,
                          color: Colors.black,))
                    ),
                    controller: _passwordTextController,
                    obscureText: !passwordVisible,
                    validator: (value) {
                      if (value==null || value.isEmpty){
                        return "Password can't be empty";
                      }
                      if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,12}$').hasMatch(value)){
                        return "Password contains[A-Z,a-z,(123..)(8-12 characters),(!@#\$&*~)]";

                      }
                      return null ;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: TextButton(onPressed: () {
                      setState(() {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                          return const ForgotPassword();
                        },));
                      });
                      }, child: const Text("Forgot your password?",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),)
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color:Colors.black,
                        borderRadius: BorderRadius.circular(30)

                    ),
                    width: 220,
                    height: 53,
                    child: TextButton( onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _emailPassController.updateLoading();
                        try {
                          UserCredential? userCredential =
                          await _emailPassController
                              .signinUser(
                            _emailTextController.text,
                            _passwordTextController.text,
                          );
                          if (userCredential!
                              .user!.emailVerified) {
                            final user = userCredential.user;
                            Get.off(() => const MainPage1(),
                                transition: Transition
                                    .leftToRightWithFade);
                          }
                        } catch (e) {
                          print(e);
                        } finally {
                          _emailPassController.updateLoading();
                        }
                      }
                    }, child: const Text("Sign in",style: TextStyle(
                        fontWeight:FontWeight.bold ,
                        color: Colors.white,
                        fontSize: 23
                    ),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(onPressed: () {
                  setState(() {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      return const LoginPage24();
                    },));
                  });
                  }, child: const Text("New user? Create new account",style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),)
                  ),
                ),
                const SizedBox(
                  width: 50,
                  height: 50,
                ),
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
      ),
    );
  }
}