import 'package:flutter/material.dart';
import 'package:golf/widget/navigation_drawer.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class log_keluar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Log keluar'),
          centerTitle: true,
          backgroundColor: Color(0XFF40E0D0),
        ),
        // body: ElevatedButton.icon(onPressed: (FirebaseAuth.instance.signOut){}, icon: Icon(Icons.arrow_back,size: 32,), label: Text('Log out',style: TextStyle(fontSize: 24),)),
      );
}
