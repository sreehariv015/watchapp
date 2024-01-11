import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/verify-phone-controller.dart';
class VerifyOtp extends StatefulWidget {
  final String verificationId;
  const VerifyOtp({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  final mobile=TextEditingController();
  final mobilekey=GlobalKey<FormState>();
  bool isLoading6 = false;
  final SentOtpController _sentOtpController = Get.put(SentOtpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: mobilekey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 320,),
              const Center(child: Text('OTP Verification',
                style: TextStyle(
                    fontSize: 36,
                    color: Colors.red
                ),)),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text('Enter the OTP code to verify your phone number',
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
                      hintText: "OTP NO",
                      hintStyle: TextStyle(
                          color: Colors.black
                      ),
                      prefixIcon: Icon(Icons.phone_android)),
                  controller: mobile,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please input your OTP";
                    }
                    return null;
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
                    // Call your verification function from the controller
                    // Pass the entered OTP and verification ID
                    _sentOtpController.verifyOtp(mobile.text, widget.verificationId);

                  }, child: const Text("Continue",
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
