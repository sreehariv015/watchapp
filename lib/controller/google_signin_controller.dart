import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:watchapp/view/auth_ui/welcome_screen.dart';

import '../models/user_model.dart';
import '../view/screens/main_page.dart';
import '../view/auth_ui/splash_screen.dart';

class GoogleSignInController extends GetxController {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();
  Rx<User?> user = Rx<User?>(null);

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if(googleSignInAccount !=null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);


        final User? user = userCredential.user;


        if (user != null) {
          UserModel userModel = UserModel(
            uId: user.uid,
            username:user.displayName.toString(),
            email: user.email.toString(),
            phone: user.phoneNumber.toString(),
            userImg: user.photoURL.toString(),
            country:'',
            userAddress:'',
            street:'',
            isAdmin: false,
            isActive: true,
            createdOn: DateTime.now(),
            city:'',
          );


          await FirebaseFirestore.instance
                .collection('users')
                .doc(user.uid)
                .set(userModel.toMap());
           Get.offAll(() => const MainPage1());
        }
      }
    } catch (e) {
      print("error $e");
    }
  }
      Future<void> signOutGoogle() async {
       try {
         await _googleSignIn.signOut();
         user(null);
         print("User Signed Out");
          Get.offAll(() => const WelcomeScreen1() );
       }catch (e) {
         print("Error signing out: $e");
       }
      }
}