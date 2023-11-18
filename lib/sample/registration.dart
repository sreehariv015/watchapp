import 'package:flutter/material.dart';

class LoginPage24 extends StatefulWidget {
  const LoginPage24({super.key});

  @override
  State<LoginPage24> createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage24> {
  final registrationkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepOrangeAccent,
        body: SingleChildScrollView(
          child: Form(
            key:registrationkey ,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
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
                          color: Colors.orange
                      ),),
                  ),

                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration:
                    const InputDecoration(
                        filled: true,
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.white,)),
                        labelText: "Name",
                        prefixIcon: Icon(Icons.person)),
                    validator: (value) {
                      if (value==null || value.isEmpty){
                        return 'Enter your email';
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
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: "E-mail",
                        labelStyle: TextStyle(
                        ),
                        prefixIcon: Icon(Icons.email)),
                    validator: (value) {
                      if (value==null || value.isEmpty){
                        return 'Enter your email';
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
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: "Password",
                        labelStyle: TextStyle(
                        ),
                        prefixIcon: Icon(Icons.lock)),
                    validator: (value) {
                      if (value==null || value.isEmpty){
                        return 'Enter your password';
                      }
                      return null ;
                    },
                  ),
                ),
                TextButton(onPressed: () {

                }, child: const Text("Already have an account",style: TextStyle(
                  color: Colors.white,
                ),)
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color:Colors.white54,
                        borderRadius: BorderRadius.circular(30)

                    ),
                    width: 100,
                    height: 40,
                    child: TextButton(onPressed: () {
                      if(registrationkey.currentState!.validate()){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Success")),);
                      }

                    }, child: const Text("Login",style: TextStyle(
                        color: Colors.white,
                        fontSize: 23
                    ),)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Or continue with"),
                    IconButton(onPressed: () {

                    }, icon:const Image(image: AssetImage('assets/images/google.png'))),
                    IconButton(onPressed: () {

                    }, icon:const Image(image: AssetImage('assets/images/phone.png'))),
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