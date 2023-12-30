// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:watchapp/view/screens/splash_screen.dart';
// import '../../controller/verify-phone-controller.dart';
//
//
// class SendOtp extends StatefulWidget {
//   const SendOtp({Key? key}) : super(key: key);
//
//   @override
//   State<SendOtp> createState() => _SendOtpState();
// }
//
// class _SendOtpState extends State<SendOtp> {
//   final SentOtpController _sentOtpController = Get.put(SentOtpController());
//   final TextEditingController _phoneNumberController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         // backgroundColor: AppConstant.appScendoryColor,
//         appBar: AppBar(
//           leading: IconButton(onPressed: () => Get.offAll(() => const SplashScreen1(),
//               transition: Transition.leftToRightWithFade), icon: const Icon(CupertinoIcons.back,color: Colors.white)),
//           centerTitle: true,
//           title:Text("Send OTP", style: TextStyle(
//             color: Colors.white,
//             fontSize: 18.sp,
//             fontFamily: 'Roboto-Bold',
//           )),
//           // backgroundColor: AppConstant.appScendoryColor,
//           elevation: 0,
//         ),
//         body: SingleChildScrollView(
//           child: Container(
//             width: Get.width,
//             height: Get.height,
//             alignment: Alignment.center,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Form(
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             decoration: InputDecoration(
//                                 errorStyle: const TextStyle(
//                                   color: Colors.yellow,
//                                   fontSize: null,
//                                   fontWeight: FontWeight.w400,
//                                   fontStyle: FontStyle.normal,
//                                 ),
//                                 prefixIcon: const Icon(Icons.phone),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10.r),
//                                   borderSide: const BorderSide(color: Colors.transparent),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10.r),
//                                   borderSide: const BorderSide(color: Colors.transparent),
//                                 ),
//                                 contentPadding:
//                                 EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
//                                 filled: true,
//                                 fillColor: const Color(0xFFF1F4FF),
//                                 hintText: "Enter your mobile number",
//                                 hintStyle: TextStyle(
//                                   color: Colors.black54,
//                                   fontFamily: 'Roboto-Regular',
//                                   fontSize: 15.sp,
//                                   height: 0.h,
//                                 )),
//                             controller: _phoneNumberController,
//                             keyboardType: TextInputType.phone,
//                           ),
//                         ),
//                         const SizedBox(height: 16.0),
//                         ElevatedButton(
//                           style: ButtonStyle(
//                             backgroundColor: const MaterialStatePropertyAll(
//                               Colors.greenAccent,
//                             ),
//                             overlayColor: MaterialStateProperty.all(
//                                 Colors.greenAccent
//                             ),
//                             shape: MaterialStatePropertyAll(
//                                 RoundedRectangleBorder(
//                                     borderRadius:
//                                     BorderRadius.circular(9.r))),
//                           ),
//                           onPressed: () {
//                             String phoneNumber = "+91" + _phoneNumberController.text.trim();
//                             _sentOtpController.sendOtp(phoneNumber);
//                           },
//                           child: Text("Send OTP", style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18.sp,
//                             fontFamily: 'Roboto-Bold',
//                           )),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }