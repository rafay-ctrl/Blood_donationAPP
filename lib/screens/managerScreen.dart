import 'dart:js_util';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_donation/screens/Updatedonor.dart';

import 'Adddonor.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class ManagerScreen extends StatefulWidget {
  const ManagerScreen({super.key});

  @override
  State<ManagerScreen> createState() => _ManagerScreenState();
}

class _ManagerScreenState extends State<ManagerScreen> {
  final CollectionReference _Donors =
      FirebaseFirestore.instance.collection('Donors');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Donors Display"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Details(),
                    ));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: StreamBuilder(
          stream: _Donors.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[index];
                    return InkWell(
                      onTap: () {
                       Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Update(),
                    ));
                      },
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          title: Text(documentSnapshot['Name']),
                          subtitle: Text(documentSnapshot['Phone']),
                          trailing: Text(documentSnapshot['Blood Group']),
                        ),
                      ),
                    );
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
