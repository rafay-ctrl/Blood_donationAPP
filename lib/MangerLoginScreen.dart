import 'package:flutter/material.dart';
import 'package:project_donation/screens/managerScreen.dart';

late Size mq;

class ManagerLoginScreen extends StatefulWidget {
  const ManagerLoginScreen({super.key});

  @override
  State<ManagerLoginScreen> createState() => _ManagerLoginScreenState();
}

class _ManagerLoginScreenState extends State<ManagerLoginScreen> {
  @override
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  var email = "Admin@blood.org";
  var password = "admin";
  AdminLogin() {
    
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ManagerScreen(),
          ));
    
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
                child: const Text(
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
                          "ADMIN LOGIN AREA",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: EmailController,
                        decoration: const InputDecoration(
                          filled: true,
                          hintText: "Enter Email",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: PasswordController,
                        decoration: const InputDecoration(
                          filled: true,
                          hintText: "Enter Password",
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
                            AdminLogin();
                          },
                          child: const Text("SIGN IN")),
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


