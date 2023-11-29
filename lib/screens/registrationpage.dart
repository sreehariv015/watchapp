import 'package:flutter/material.dart';
import 'package:watchapp/screens/loginpage.dart';
import 'package:watchapp/screens/phone_number_page.dart';

class LoginPage24 extends StatefulWidget {
  const LoginPage24({super.key});

  @override
  State<LoginPage24> createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage24> {
  bool passwordVisible=false;
  bool passVisible=false;

  var name=TextEditingController();
  var email=TextEditingController();
  var password=TextEditingController();
  var confirm_password=TextEditingController();

  final registrationkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key:registrationkey ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 25),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 150,
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
                  padding: EdgeInsets.all(5.0),
                  child: Center(
                    child: Text("Create Account",
                      style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.bold,
                          color: Colors.red
                      ),),
                  ),
                ),
                const Text("Create an Account it's free",
                  style:TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ) ,),
                const SizedBox(
                  width: 50,
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration:
                    const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.white,)),
                        hintText: "Name",
                        hintStyle: TextStyle(
                          color: Colors.black
                        ),
                        prefixIcon: Icon(Icons.person,
                          color: Colors.black,)),
                    validator: (value) {
                      if (value==null || value.isEmpty){
                        return "Name can't be empty";
                      }
                      if(!RegExp(r'^[A-Za-z]+([\ A-Za-z]+)$').hasMatch(value)){
                        return "Enter a valid email address";
                      }
                      return null ;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: "E-mail",
                        hintStyle: TextStyle(
                          color: Colors.black
                        ),
                        prefixIcon: Icon(Icons.email,color: Colors.black,)),
                    controller: email,
                    validator: (value) {
                      if (value==null || value.isEmpty){
                        return "Email can't be empty";
                      }
                      if(!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value)){
                        return "Enter a valid email address";
                      }
                      return null ;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    //obscureText: true,
                   // obscuringCharacter: "*",
                    decoration:  InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
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
                      }, icon: Icon(passwordVisible?Icons.visibility:Icons.visibility_off,color: Colors.black,))
                    ),
                    controller: password,
                    obscureText: !passwordVisible,
                    validator: (value) {
                      if (value==null || value.isEmpty){
                        return "Password can't be empty";
                      }
                      if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,12}$').hasMatch(value)){
                        return "Password contains[A-Z,a-z,(123..)(8-12 characters),(!@#\$&*~)]";
                      }
                      return null ;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                   // obscureText: true,
                    //obscuringCharacter: "*",
                    decoration:  InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: "Confirm Password",
                        hintStyle: const TextStyle(
                            color: Colors.black
                        ),
                        prefixIcon: const Icon(Icons.lock,color: Colors.black,),
                    suffixIcon: IconButton(onPressed: () {
                      setState(() {
                        passVisible=!passVisible;
                      });
                    }, icon: Icon(passVisible?Icons.visibility:Icons.visibility_off,color: Colors.black,))
                    ),
                    controller: confirm_password,
                    obscureText: !passVisible,
                    validator: (value) {
                      if (value==null || value.isEmpty){
                        return "Re-enter your password";
                      }
                      else if(value!=password.text){
                        return 'Password contains[A-Z,a-z,(123..)(8-12 characters),(!@#\$&*~)]';
                      }
                      return null ;
                    },
                  ),
                ),
                const SizedBox(
                  width: 50,
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color:Colors.black,
                        borderRadius: BorderRadius.circular(30)

                    ),
                    width: 260,
                    height: 50,
                    child: TextButton(onPressed: () {
                      if(registrationkey.currentState!.validate()){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Success")),);
                        setState(() {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                            return const Login11();
                          },));
                        });
                      }

                    }, child: const Text("Sign up",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 23
                    ),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(onPressed: () {
                     setState(() {
                       Navigator.push(context, MaterialPageRoute(builder: (context) {
                         return const Login11();
                       },));
                     });
                  }, child: const Text("Already have an account",
                    style: TextStyle(
                    color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),)
                  ),
                ),
                const SizedBox(
                  width: 30,
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Or continue with",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),),
                ),
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