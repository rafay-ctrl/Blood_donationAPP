import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Update extends StatefulWidget {
  const Update({super.key});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  @override
  Widget build(BuildContext context) {
    
     final CollectionReference _Donors =
      FirebaseFirestore.instance.collection('Donors');
  TextEditingController NameController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();
  TextEditingController GroupController = TextEditingController();
  var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
 
    return AlertDialog(
      scrollable: true,
        title: const Text(
          'Update Donor Details',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.brown),
        ),
        content: SizedBox(
          height: height * 0.35,
          width: width,
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: NameController,
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    hintText: 'Update Donor Name',
                    hintStyle: const TextStyle(fontSize: 14),
                    icon: const Icon(CupertinoIcons.person, color: Colors.red),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: PhoneController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    hintText: 'Update Mobile Phone',
                    hintStyle: const TextStyle(fontSize: 14),
                    icon: const Icon(CupertinoIcons.phone, color: Colors.brown),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: GroupController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    hintText: 'Update Blood Group',
                    hintStyle: const TextStyle(fontSize: 14),
                    icon: const Icon(CupertinoIcons.drop, color: Colors.brown),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.grey,
            ),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              final UpdateName = NameController.text;
              final UpdatePhone = PhoneController.text;
              final UpdateGroup = GroupController.text;
              await _Donors.doc().update({
                'Name': UpdateName,
                "Phone": UpdatePhone,
                "Blood Group": UpdateGroup
              });
              NameController.text = " ";
              PhoneController.text = " ";
              GroupController.text = " ";
              Navigator.of(context).pop();
            },
            child: const Text('Save'),
          ),
        ],

    );
  }
}