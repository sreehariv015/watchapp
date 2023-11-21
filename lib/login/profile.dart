import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var email=TextEditingController();
  var password=TextEditingController();
  var mobile=TextEditingController();

  final save_key= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Form(
          key: save_key,
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  const Center(
                      child: Text("Profile",
                    style: TextStyle(
                      color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold

                    ),)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                        children: [
                      const CircleAvatar(
                        radius: 86,
                        backgroundImage: AssetImage(
                          'assets/images/luffy.jpg',
                        ),
                      ),
                      Positioned(
                          left: 130,
                          top: 110,
                          child: IconButton(
                              onPressed: () {

                              },
                              icon: const Icon(
                                Icons.add_a_photo_rounded,
                                color: Colors.redAccent,
                                size: 35,
                              )))
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration:
                      const InputDecoration(
                          filled: true,
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(color: Colors.white,)),
                          hintText: "Name",
                          hintStyle: TextStyle(
                              color: Colors.black
                          ),
                          prefixIcon: Icon(Icons.person)),
                      validator: (value) {
                        if (value==null || value.isEmpty){
                          return "Name can't be empty";
                        }
                        return null ;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration:
                      const InputDecoration(
                          filled: true,
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(color: Colors.white,)),
                          hintText: "Mobile",
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(color: Colors.white)),
                          hintText: "E-mail",
                          hintStyle: TextStyle(
                              color: Colors.black
                          ),
                          prefixIcon: Icon(Icons.email)),
                      controller: email,
                      validator: (value) {
                        if (value==null || value.isEmpty){
                          return "Email can't be empty";
                        }
                        if(!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value)){
                          return "Enter a valid email address";
                        }
                        return null ;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      //obscureText: true,
                      // obscuringCharacter: "*",
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(color: Colors.white)),
                          hintText: "Password",
                          hintStyle: TextStyle(
                              color: Colors.black
                          ),
                          prefixIcon: Icon(Icons.lock)),
                      controller: password,
                      validator: (value) {
                        if (value==null || value.isEmpty){
                          return "Password can't be empty";
                        }
                        if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,12}$').hasMatch(value)){
                          return "Enter valid password";
                        }
                        return null ;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.circular(30)

                      ),
                      width: 220,
                      height: 53,
                      child: TextButton(onPressed: () {
                        if(save_key.currentState!.validate()){
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Success")),);
                        }

                      }, child: const Text("Update",style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                        fontWeight: FontWeight.bold
                      ),)),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
