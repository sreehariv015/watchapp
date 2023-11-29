import 'package:flutter/material.dart';
import 'package:watchapp/screens/loginpage.dart';
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var email=TextEditingController();


  final forgotkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     body: Form(
       key: forgotkey,
       child: SingleChildScrollView(
         child: Column(
           children: [
             const SizedBox(height: 310,),
             const Center(
                 child: Padding(
                   padding: EdgeInsets.all(8.0),
                   child: Text("Forgot Password",
               style: TextStyle(
                   fontSize: 36,
                   //fontWeight: FontWeight.bold,
                   color: Colors.red
               ),),
                 )),
             const Padding(
               padding: EdgeInsets.all(8.0),
               child: Center(
                 child: Text("please enter the email address you'd like your password reset information sent to...",
                   textAlign: TextAlign.center,
                   style: TextStyle(
                     color: Colors.black,
                   )),
               ),
             ),
             const SizedBox(height: 25,),
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
                     prefixIcon: Icon(Icons.email)),
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
             const SizedBox(height: 15,),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 decoration: BoxDecoration(
                     color:Colors.red,
                     borderRadius: BorderRadius.circular(30)

                 ),
                 width: 260,
                 height: 50,
                 child: TextButton(onPressed: () {
                   if(forgotkey.currentState!.validate()){
                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Success")),);
                   }

                 }, child: const Text("Reset password",
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 20,
                     fontWeight: FontWeight.bold
                   ),)),
               ),
             ),
           ],
         ),
       ),
     ),
    );
  }
}
