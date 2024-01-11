import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/verify-phone-controller.dart';
class MobileNumber1 extends StatefulWidget {
  const MobileNumber1({super.key});

  @override
  State<MobileNumber1> createState() => _MobileNumber1State();
}

class _MobileNumber1State extends State<MobileNumber1> {
  final SentOtpController _sentOtpController = Get.put(SentOtpController());
  final TextEditingController _phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 320,),
              const Center(child: Text("Phone Verification",
                style: TextStyle(
                    fontSize: 36,
                    color: Colors.red
                ),)),
              const Padding(
                padding: EdgeInsets.all(8.0),
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
                  keyboardType: TextInputType.phone,
                  decoration:
                  const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white,)),
                      hintText: "Mobile No",
                      hintStyle: TextStyle(
                          color: Colors.black
                      ),
                      prefixIcon: Icon(Icons.phone_android)),
                  controller: _phoneNumberController,
                  validator: (value) {
                    if (value==null || value.isEmpty){
                      return "mobile no can't be empty";
                    }
                    if (!RegExp(r'^(\+91[\-\s]?)?[0]?(91)?[789]\d{9}$')
                        .hasMatch(value)) {
                      return "enter a valid mobile number";
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
                    String phoneNumber = "+91${_phoneNumberController.text.trim()}";
                    _sentOtpController.sendOtp(phoneNumber);

                  }, child: const Text("Send the code",
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
