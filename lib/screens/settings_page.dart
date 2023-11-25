
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.settings),
        title: const Text("Settings"),
        backgroundColor: Colors.white10,
      ),
      backgroundColor: Colors.white70,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                onTap: () {},
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
                onTap: () {},
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
                onTap: () {},
                leading: const Icon(Icons.logout,
                  size: 30,
                  color: Color(0xFF4A4A5F),
                ),
                title: const Text("Log Out",
                  style: TextStyle(
                    fontSize: 19,
                  ),),
              ),
            ),
          )
        ],
      ),

    );
  }
}