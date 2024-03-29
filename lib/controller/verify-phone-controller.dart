import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:watchapp/view/screens/main_page.dart';
import '../models/user_model.dart';
import '../view/auth_ui/phone_number_otp_sent_page.dart';
import 'get-device-token-controller.dart';
// Import Firestore

class SentOtpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GetDeviceTokenController getDeviceTokenController =
  Get.put(GetDeviceTokenController());

  void sendOtp(String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // This callback will be invoked in case of automatic verification
          // You may choose to sign in the user here
          await _auth.signInWithCredential(credential);
          Get.snackbar("Success", "Automatic Verification Completed");
        },
        verificationFailed: (FirebaseAuthException e) {
          // Handle the verification failure
          Get.snackbar("Error", "Verification Failed: ${e.message}");
        },
        codeSent: (String verificationId, int? resendToken) {
          // This callback will be invoked when the code is successfully sent
          // Save the verification ID somewhere to use it later
          Get.snackbar("Code Sent", "Code Sent to $phoneNumber");
          Get.to(() => VerifyOtp(verificationId: verificationId));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // This callback will be invoked when the code auto-retrieval has timed out
          Get.snackbar("Timeout", "Auto Retrieval Timeout: $verificationId");
        },
      );
    } catch (e) {
      // Handle exceptions
      Get.snackbar("Error", "Error: $e");
    }
  }

  void verifyOtp(String otp, String verificationId) async {
    try {
      UserCredential userCredential = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: otp,
        ),
      );

      // Extracted user data and corrected the usage of userCredential
      UserModel userModel = UserModel(
        uId: userCredential.user!.uid,
        username: userCredential.user!.displayName ??
            'guest', // Use an empty string as a fallback
        email: userCredential.user!.email ?? 'guestuser000@gmail.com',
        phone: userCredential.user!.phoneNumber ?? '',
        userImg: userCredential.user!.photoURL ??
            'https://firebasestorage.googleapis.com/v0/b/watch-mate.appspot.com/o/Shah-Rukh-Khan-Baadhshah-Of-Bollywood.jpg?alt=media&token=8403f78c-06e8-465d-b451-9a131f3f6b52',
        country: '',
        userAddress: '',
        street: '',
        isAdmin: false,
        isActive: true,
        createdOn: DateTime.now(),
        city: '',
      );

      try {
        await FirebaseFirestore.instance // Save user data to Firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(userModel.toMap());
      } catch (error) {
        print('Error saving user data to Firestore: $error');
        Get.snackbar(
          "Error",
          "$error",
          snackPosition: SnackPosition.BOTTOM,
        );
      }

      Get.snackbar('Success', 'Registration Successful');

      // Display success message
      Get.snackbar("Success", "Verification Successful");

      // Navigate to the next screen or perform any other action
      // For example, you might want to navigate to a home screen
      Get.offAll(() => const MainPage1());
    } catch (e) {
      // Handle exceptions
      Get.snackbar("Error", "Verification Failed: $e");
    }
  }
}