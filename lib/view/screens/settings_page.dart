
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:watchapp/view/auth_ui/welcome_screen.dart';
import 'package:watchapp/view/screens/profile.dart';

import '../../controller/google_signin_controller.dart';
import 'home_page.dart';
class Settings1 extends StatefulWidget {
  const Settings1({super.key});

  @override
  State<Settings1> createState() => _Settings1State();
}

class _Settings1State extends State<Settings1> {
  bool switchOn1=false;
  bool switchOn2=false;
  String dropdownValue='Malayalam';
  var languages=[
    'Malayalam',
    'English',
    'Tamil',
    'Hindi',
  ];
  GoogleSignInController googleSignInController=GoogleSignInController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        shape: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
                topRight: Radius.circular(40)
            )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Stack(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                          'assets/images/profile.png',
                        ),
                      ),
                      Positioned(
                          left: 65,
                          top: 68,
                          child: IconButton(
                              onPressed: () {

                              },
                              icon: const Icon(
                                Icons.add_a_photo_rounded,
                                color: Colors.black,
                                size: 20,
                              )))
                    ]),
              ),
              const Text("RDJ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.red
                ),
              ),
              const Text("rdj@gmail.com",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const HomePage();
                    },));
                  },
                  leading: const Icon(Icons.home,
                    size: 30,
                    color: Color(0xFF000000),
                  ),
                  title: const Text("Home",
                    style: TextStyle(
                      fontSize: 19,
                    ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const Profile();
                    },));
                  },
                  leading: const Icon(Icons.account_box_outlined,
                    size: 30,
                    color: Color(0xFF000000),
                  ),
                  title: const Text("Accounts",
                    style: TextStyle(
                      fontSize: 19,
                    ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                  },
                  leading: const Icon(Icons.shopping_cart,
                    size: 30,
                    color: Color(0xFF000000),
                  ),
                  title: const Text("My Orders",
                    style: TextStyle(
                      fontSize: 19,
                    ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const Settings1();
                    },));
                  },
                  leading: const Icon(Icons.settings,
                    size: 30,
                    color: Color(0xFF000000),
                  ),
                  title: const Text("Settings",
                    style: TextStyle(
                      fontSize: 19,
                    ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                  },
                  leading: const Icon(Icons.logout,
                    size: 30,
                    color: Color(0xFF000000),
                  ),
                  title: const Text("Logout",
                    style: TextStyle(
                      fontSize: 19,
                    ),),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Profile();
                  },));
                },
                leading: const Icon(Icons.account_circle,
                  size: 30,
                  color: Color(0xFF4A4A5F),
                ),
                title: const Text("Accounts",
                  style: TextStyle(
                    fontSize: 19,
                  ),),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                onTap: () {},
                leading: const Icon(Icons.privacy_tip,
                  size: 30,
                  color: Color(0xFF4A4A5F),
                ),
                title: const Text("Privacy Policy",
                  style: TextStyle(
                    fontSize: 19,
                  ),),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                onTap: () {},
                leading: const Icon(Icons.notifications,
                  size: 30,
                  color: Color(0xFF4A4A5F),
                ),
                title: const Text("Notifications",
                  style: TextStyle(
                    fontSize: 19,
                  ),),
                trailing: Transform.scale(
                  scale: 0.9,
                  child: Switch(value: switchOn1,
                    activeColor: Colors.black,
                    onChanged:(value) {
                      setState(() {
                        switchOn1=!switchOn1;
                      });
                    }, ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                onTap: () {},
                leading: const Icon(Icons.dark_mode,
                  size: 30,
                  color: Color(0xFF4A4A5F),
                ),
                title: const Text("Dark mode",
                  style: TextStyle(
                    fontSize: 19,
                  ),),
                trailing: Transform.scale(
                  scale: 0.9,
                  child: Switch(value: switchOn2,
                    activeColor: Colors.black,
                    onChanged: (value) {
                      setState(() {
                        switchOn2=!switchOn2;
                      });
                    },),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                onTap: () {},
                leading: const Icon(Icons.language,
                  size: 30,
                  color: Color(0xFF4A4A5F),
                ),
                title:  const Text("Language",
                  style: TextStyle(
                    fontSize: 19,
                  ),),
                trailing: DropdownButton(
                  value: dropdownValue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items:languages.map((String items){
                    return DropdownMenuItem(
                      value: items,
                      child:Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue=newValue!;
                    });

                  },),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                onTap: () {},
                leading: const Icon(Icons.password,
                  size: 30,
                  color: Color(0xFF4A4A5F),
                ),
                title: const Text("Change password",
                  style: TextStyle(
                    fontSize: 19,
                  ),),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                onTap: () {

                },
                leading: const Icon(Icons.account_circle,
                  size: 30,
                  color: Color(0xFF4A4A5F),
                ),
                title: const Text("Delete Account",
                  style: TextStyle(
                    fontSize: 19,
                  ),),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  setState(() {
                    googleSignInController.signOutGoogle();
                  });
                },
                leading: const Icon(Icons.logout,
                  size: 30,
                  color: Colors.red,
                ),
                title: const Text("Log Out",
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.red
                  ),),
              ),
            ),
          )
        ],
      ),

    );
  }
}