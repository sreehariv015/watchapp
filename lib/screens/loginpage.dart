import 'package:flutter/material.dart';
import 'package:watchapp/screens/forgot_password_page.dart';
import 'package:watchapp/screens/registrationpage.dart';

class Login11 extends StatefulWidget {
  const Login11({super.key});

  @override
  State<Login11> createState() => _LoginPage1State();
}

class _LoginPage1State extends State<Login11> {
  bool passwordVisible=false;

  var emailController = TextEditingController();
  var passController = TextEditingController();


  final loginkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key:loginkey ,
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
                            fontWeight: FontWeight.bold
                        ),
                        prefixIcon: Icon(Icons.mail)),
                    controller: emailController,
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
                            fontWeight: FontWeight.bold

                        ),
                        prefixIcon: const Icon(Icons.lock,),
                        suffixIcon: IconButton(onPressed: () {
                          setState(() {
                            passwordVisible=!passwordVisible;
                          });
                        }, icon: Icon(passwordVisible?Icons.visibility:Icons.visibility_off))
                    ),
                    controller: passController,
                    obscureText: passwordVisible,
                    validator: (value) {
                      if (value==null || value.isEmpty){
                        return "Password can't be empty";
                      }
                      if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,12}$').hasMatch(value)){
                        return "Enter password";

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
                    child: TextButton(onPressed: () {
                      if(loginkey.currentState!.validate()){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Success")),);
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
                      return LoginPage24();
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

                      }, icon:const Image(image: AssetImage('assets/images/google.png'))),
                    ),
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: IconButton(onPressed: () {

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