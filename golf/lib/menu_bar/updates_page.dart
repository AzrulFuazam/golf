import 'package:flutter/material.dart';
import 'package:golf/widget/navigation_drawer.dart';

class UpdatesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Slot Kosong'),
          centerTitle: true,
          backgroundColor: Color(0XFF40E0D0),
        ),
      );
}
