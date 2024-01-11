import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controller/get_user_data_controller.dart';
import '../../controller/google_signin_controller.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final GoogleSignInController googleSignInController = GoogleSignInController();
  final GetUserDataController _getUserDataController = Get.put(GetUserDataController());

  late final User user;
  late List<QueryDocumentSnapshot<Object?>> userData = [];

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser!;
    _getUserData();
  }

  Future<void> _getUserData() async {
    userData = await _getUserDataController.getUserData(user.uid);
    if (mounted) {
      setState(() {});
    }
  }


  var email=TextEditingController();
  var password=TextEditingController();
  var mobile=TextEditingController();

  final save_key= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Stack(
        children: [
        // Background image
        Image.asset(
        'assets/images/img.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100,),
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 CircleAvatar(
                   radius: 60,
                   backgroundImage: NetworkImage(
                     userData.isNotEmpty && userData[0]['userImg'] != null && userData[0]['userImg'].isNotEmpty
                         ? userData[0]['userImg']
                         : 'https://via.placeholder.com/150', // Placeholder URL for testing
                   ),
                 ),
               ],
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text(
                    "${userData.isNotEmpty ? userData[0]['username'] : 'N/A'}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
            ),
                 ),
               ],
             ),
            const SizedBox(height: 10),
            ProfileDetail(label: 'Email', value: '${userData.isNotEmpty ? userData[0]['email'] : 'N/A'}'),
            ProfileDetail(label: 'Phone no', value: '**** ***** ****'),
            ProfileDetail(label: 'Address', value: '**** ***** ****'),
          ],
        ),
      ),
      ]
    ),
    );
  }
}
class ProfileDetail extends StatelessWidget {
  final String label;
  final String value;

  ProfileDetail({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 20),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}