import 'package:flutter/material.dart';
import 'package:project_donation/screens/loginscreen.dart';
import 'package:project_donation/screens/managerScreen.dart';

import '../MangerLoginScreen.dart';

late Size mq;

class RoleScreen extends StatelessWidget {
  const RoleScreen({super.key});

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
          child: Container(
            color: Colors.white,
            width: mq.width * 1,
            height: 365,
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: Container(
                      child: const Text(
                        "Enter your Role",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: const Text("Donor..."))),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  const ManagerLoginScreen()));
                          },
                          child: const Text("Manager")))
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
