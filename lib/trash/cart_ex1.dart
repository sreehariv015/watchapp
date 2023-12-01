
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:watchapp/screens/profile.dart';
import 'package:watchapp/screens/settings_page.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        iconTheme: const IconThemeData(
            color: Colors.black
        ),
      ),
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
                      return const Homepage();
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
      bottomNavigationBar:  CurvedNavigationBar(
        backgroundColor: Colors.white,
        items: const <Widget>[
          Icon(Icons.home, size: 30,),
          Icon(Icons.favorite, size: 30,),
          Icon(Icons.shopping_cart, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        color: Colors.white,
        onTap: (index) {
          setState(() {

          });
        },
      ),
    );
  }
}
