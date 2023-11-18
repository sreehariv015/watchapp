import 'package:flutter/material.dart';

class LoginPage1 extends StatefulWidget {
  const LoginPage1({super.key});

  @override
  State<LoginPage1> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage('assets/images/img2.jpg'))

     ),
          child: Column(children: [

            Padding(padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Enter your name",
                    hintStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    label: const Text("User name",style: TextStyle(
                        color: Colors.white,
                    ),),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    )

                ),
              ),
            ),
            Padding(padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Enter your password",
                    hintStyle: const TextStyle(
                        color: Colors.white
                    ),
                    label: const Text("Password",style: TextStyle(
                        color: Colors.white,
                    ),),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    )

                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton(onPressed: () {

                }, child: const Text("Forgot Password ?",style: TextStyle(
                    color: Colors.white,

                ),))
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(33),
                  color: Colors.pink,
                ),
                width: 400,
                height: 50,
                child: TextButton(onPressed: () {

                }, child: const Text("Login",style: TextStyle(
                    color: Colors.white,
                  fontSize: 23
                ),)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextButton(onPressed: () {

              }, child: const Text("New user? Create new account",style: TextStyle(
                  color: Colors.white,
              ),)
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
