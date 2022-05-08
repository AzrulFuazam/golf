import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:golf/widget/navigation_drawer.dart';

class laman_utama extends StatelessWidget {
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
