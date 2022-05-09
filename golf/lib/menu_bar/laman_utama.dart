import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:golf/widget/navigation_drawer.dart';

class laman_utama extends StatefulWidget {
  const laman_utama({Key? key}) : super(key: key);

  @override
  State<laman_utama> createState() => _laman_utama();
}

class _laman_utama extends State<laman_utama> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Laman Utama'),
          centerTitle: true,
          backgroundColor: Color(0XFF40E0D0),
        ),
      );
}
