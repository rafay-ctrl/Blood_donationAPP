import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_donation/screens/signupScreen.dart';

import 'Homescreen.dart';

late Size mq;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  bool isLoading = false;
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  Login() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: EmailController.text, password: PasswordController.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: 'Wrong password provided for that user.');
      }
    }
  }

  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      
      body: Stack(children: [
        Container(
            color: Colors.red,
            height: mq.height * 0.4,
            width: mq.width * 1,
            child: Column(children: [
              Container(
                height: 116.71,
                width: 93.3,
                child: Image.asset('assets/blood.jpeg'),
              ),
              Container(
                height: 50,
                child: Text(
                  "zindagi",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )
            ])),
        Padding(
          padding: const EdgeInsets.only(top: 193, left: 28, right: 28),
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              height: 365,
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Container(
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: EmailController,
                        decoration: const InputDecoration(
                          filled: true,
                          hintText: "Email",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: PasswordController,
                        decoration: const InputDecoration(
                          filled: true,
                          hintText: "Password",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 1),
                      child: ElevatedButton(
                          onPressed: () {
                            Login();
                          },
                          child: const Text("SIGN IN")),
                    ),
                    InkWell(
                      child: const Text(
                        'Dont have account? Sign Up',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff4c505b)),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ));                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
