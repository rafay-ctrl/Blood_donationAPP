import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_donation/screens/Homescreen.dart';

late Size mq;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController CityController = TextEditingController();
  TextEditingController BloodGroupController = TextEditingController();
  TextEditingController PhoneNumberGroupController = TextEditingController();
  registeruser() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: EmailController.text,
        password: PasswordController.text,
      );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
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
                        child: const Text(
                          "Welcome to Sign Up ",
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
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: CityController,
                        decoration: const InputDecoration(
                          filled: true,
                          hintText: "Enter City",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: PhoneNumberGroupController,
                        decoration: const InputDecoration(
                          filled: true,
                          hintText: "Enter Phone Number",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: BloodGroupController,
                        decoration: const InputDecoration(
                          filled: true,
                          hintText: "Enter your Blood Group",
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
                            registeruser();
                          },
                          child: const Text("Create Profile")),
                    )
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
