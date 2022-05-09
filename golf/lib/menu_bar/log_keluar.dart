import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:golf/authentication/login.dart';
import 'package:golf/authentication/userModel.dart';
import 'package:golf/widget/navigation_drawer.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class log_keluar extends StatefulWidget {
  const log_keluar({Key? key}) : super(key: key);

  @override
  State<log_keluar> createState() => _log_keluar();
}

class _log_keluar extends State<log_keluar> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Log keluar'),
          centerTitle: true,
          backgroundColor: Color(0XFF40E0D0),
        ),
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0XFF40E0D0),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
            child: Text('Log Out'),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text('Are you sure?'),
                        actions: [
                          TextButton(
                              child: Text('Cancel'),
                              onPressed: () => Navigator.pop(context)),
                          TextButton(
                              child: Text('Ok'),
                              onPressed: () {
                                logout(context);
                              }),
                        ],
                      ));
            },
          ),
        ),
        // body: ElevatedButton.icon(onPressed: (FirebaseAuth.instance.signOut){}, icon: Icon(Icons.arrow_back,size: 32,), label: Text('Log out',style: TextStyle(fontSize: 24),)),
        /*body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Email :' + "${loggedInUser.email}"),
              ActionChip(
                  label: Text("Logout"),
                  onPressed: () {
                    logout(context);
                  }),
            ],
          ),
        ),*/
      );

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
