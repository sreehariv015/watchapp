import 'package:flutter/material.dart';
import 'package:watchapp/screens/loginpage.dart';
class MobileNumber1 extends StatefulWidget {
  const MobileNumber1({super.key});

  @override
  State<MobileNumber1> createState() => _MobileNumber1State();
}

class _MobileNumber1State extends State<MobileNumber1> {
  var mobile=TextEditingController();


  final mobilekey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: mobilekey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 220,),
              const Center(child: Text("Phone Verification",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87
                ),)),
              const SizedBox(height: 15,),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Center(
                  child: Text("We need to register your phone without getting started",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                      )),
                ),
              ),
              const SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration:
                  const InputDecoration(
                      filled: true,
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white,)),
                      hintText: "Mobile No",
                      hintStyle: TextStyle(
                          color: Colors.black
                      ),
                      prefixIcon: Icon(Icons.person)),
                  controller: mobile,
                  validator: (value) {
                    if (value==null || value.isEmpty){
                      return "Name can't be empty";
                    }
                    if (!RegExp(r'^(\+91[\-\s]?)?[0]?(91)?[789]\d{9}$')
                        .hasMatch(value)) {
                      return "Enter a valid mobile number address";
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
                      color:Colors.black,
                      borderRadius: BorderRadius.circular(30)

                  ),
                  width: 260,
                  height: 50,
                  child: TextButton(onPressed: () {
                    if(mobilekey.currentState!.validate()){
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Success")),);
                    }

                  }, child: const Text("Send the code",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),)),
                ),
              ),  Padding(
                padding: const EdgeInsets.all(13.0),
                child: TextButton(onPressed: () {
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const Login11();
                    },));
                  });
                }, child: const Text("Back to Login",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
