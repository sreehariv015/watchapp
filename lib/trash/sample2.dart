import 'package:flutter/material.dart';

class LoginPage22 extends StatefulWidget {
  const LoginPage22({super.key});

  @override
  State<LoginPage22> createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage22> {
  final registrationkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
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
                        height: 250,
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
                const SizedBox(
                  width: 300,
                  height: 50,
                  child: Center(
                    child: Text("Sign Up",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),),
                  ),

                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    decoration:
                    const InputDecoration(
                      filled: true,
                      fillColor: Colors.grey,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.white,)),
                        hintText: "E-mail",
                        hintStyle: TextStyle(
                          color: Colors.black,
                              fontWeight: FontWeight.bold
                        ),
                        prefixIcon: Icon(Icons.mail)),
                    validator: (value) {
                      if (value==null || value.isEmpty){
                        return "Email can't be empty";
                      }
                      return null ;
                    },
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                      decoration: const InputDecoration(
                        filled: true,
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(color: Colors.white)),
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold

                          ),
                          prefixIcon: Icon(Icons.lock,)),
                    validator: (value) {
                      if (value==null || value.isEmpty){
                        return "Password can't be empty";
                      }
                      return null ;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: () {

                    }, child: const Text("Forgot your password?",
                      style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),)
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color:Colors.grey,
                      borderRadius: BorderRadius.circular(30)

                    ),
                    width: 100,
                    height: 40,
                    child: TextButton(onPressed: () {
                      if(registrationkey.currentState!.validate()){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Success")),);
                      }

                    }, child: const Text("Login",style: TextStyle(
                        fontWeight:FontWeight.bold ,
                      color: Colors.black,
                      fontSize: 23
                    ),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(onPressed: () {

                  }, child: const Text("New user? Create new account",style: TextStyle(
                      color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),)
                  ),
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