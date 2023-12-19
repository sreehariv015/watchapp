import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'controller/controller.dart';


class LoginHome extends StatefulWidget {
  const LoginHome({super.key});

  @override
  State<LoginHome> createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  final _formKey = GlobalKey<FormState>();
  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final LoginGetx _loginController = Get.put(LoginGetx());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Form"),
        backgroundColor: Colors.teal,
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if(value==null || value.isEmpty){
                              return "Enter your name";
                            }
                            return null;
                          },
                          controller: _nameTextController,
                          cursorColor: Colors.green,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(20),
                              prefixIcon: const Icon(Icons.person),
                              hintText: "Enter your name",
                              label: const Text("Name"),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.purple, width: 2),
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          validator: (value) {
                            if(value==null || value.isEmpty){
                              return "Enter your name";
                            }
                            return null;
                          },
                          controller: _emailTextController,
                          cursorColor: Colors.green,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(20),
                              prefixIcon: const Icon(Icons.email),
                              hintText: "Enter your name",
                              label: const Text("Email"),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.purple, width: 2),
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _loginController.handleLogin(_nameTextController.text, _emailTextController.text);
                              }
                            },
                            child: const Text("Login")),
                      ],
                    )),
              )
            ],
          )),
    );
  }
}
