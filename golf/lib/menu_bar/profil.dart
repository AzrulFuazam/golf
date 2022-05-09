import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:golf/widget/mp.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:path/path.dart';
import 'package:provider/provider.dart';
import '../authentication/displayprofile.dart';
import '../authentication/userModel.dart';
import '../widget/navigation_drawer.dart';
import 'package:ndialog/ndialog.dart';
//import 'package:snapshot/snapshot.dart';

class profil extends StatefulWidget {
  const profil({Key? key}) : super(key: key);

  @override
  _profilState createState() => _profilState();
}

class _profilState extends State<profil> {
  final firestoreRef = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Color(0XFF40E0D0),
      ),
      body: SafeArea(
        child: FutureBuilder<QuerySnapshot>(
          future: firestoreRef.collection("users").get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<DocumentSnapshot> arrData = snapshot.data!.docs;
              return ListView(
                children: arrData.map((data) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        print(data.id);
                        _showUpdateDialog(data, context);
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data['First name']),
                              Text(data['Second name']),
                              Text(data['Address']),
                              Text(data['Phone number']),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            } else {
              return Text("No data Found");
            }
          },
        ),
      ),
    );
  }

  Future<void> _showUpdateDialog(DocumentSnapshot doc, BuildContext context) {
    var firstnameController =
        new TextEditingController(text: doc['First name']);
    var secondNameController =
        new TextEditingController(text: doc['Second name']);
    var addressController = new TextEditingController(text: doc['Address']);
    var phoneNumberController =
        new TextEditingController(text: doc['Phone number']);
    double height = 10;
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Update Information :" /*+ doc.id*/),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: firstnameController,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.person), labelText: 'First Name'),
                  ),
                  SizedBox(
                    height: height,
                  ),
                  TextFormField(
                    controller: secondNameController,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.person), labelText: 'Second Name'),
                  ),
                  SizedBox(
                    height: height,
                  ),
                  TextFormField(
                    controller: addressController,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.home), labelText: 'Address'),
                  ),
                  SizedBox(
                    height: height,
                  ),
                  TextFormField(
                    controller: phoneNumberController,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.phone), labelText: 'Phone Number'),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("cancel")),
              OutlineButton(
                onPressed: () {
                  if (firstnameController.text.isNotEmpty &&
                      secondNameController.text.isNotEmpty &&
                      addressController.text.isNotEmpty &&
                      phoneNumberController.text.isNotEmpty) {
                    updateData(
                        doc.id,
                        firstnameController.text,
                        secondNameController.text,
                        addressController.text,
                        phoneNumberController.text);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Please Insert All Fields Value")));
                  }
                },
                child: Text("Update"),
              )
            ],
          );
        });
  }

  void updateData(String id, String fname, String sname, String address,
      String phoneNumber) {
    Map<String, dynamic> data = {
      "First name": fname,
      "Second name": sname,
      "Address": address,
      "Phone number": phoneNumber,
    };

    firestoreRef.collection("users").doc(id).update(data).then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Update Succesfully")));
      Navigator.of(context).pop();
    });
    setState(() {});
  }
}
