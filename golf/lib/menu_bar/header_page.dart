import 'package:flutter/material.dart';
import 'package:golf/authentication/userModel.dart';
import 'package:golf/widget/navigation_drawer.dart';

class HeaderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          backgroundColor: Color(0XFF40E0D0),
          title: Text(Fname),
          centerTitle: true,
        ),
        body: Image.network(
          urlImage,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      );
}
