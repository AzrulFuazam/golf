// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:golf/widget/navigation_drawer.dart';

class newRound extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Start New Round'),
          centerTitle: true,
          backgroundColor: Color(0XFF40E0D0),
        ),
        body: Center(
          child: ListView(
            children: [
              DataTable(columns: [
                DataColumn(
                    label: Text(
                  'HOLES',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.red),
                )),
                DataColumn(
                    label: Text(
                  'PAR',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.red),
                )),
                DataColumn(
                    label: Text(
                  'SCORE',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.red),
                )),
              ], rows: [
                DataRow(cells: [
                  DataCell(Text('0001')),
                  DataCell(Text('2')),
                  DataCell(
                    Text(
                      '1',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('0002')),
                  DataCell(Text('2')),
                  DataCell(Text('1')),
                ]),
                DataRow(cells: [
                  DataCell(Text('0003')),
                  DataCell(Text('2')),
                  DataCell(Text('1')),
                ]),
                DataRow(cells: [
                  DataCell(Text('0004')),
                  DataCell(Text('2')),
                  DataCell(Text('1')),
                ]),
                DataRow(cells: [
                  DataCell(Text('0001')),
                  DataCell(Text('2')),
                  DataCell(Text('1')),
                ]),
                DataRow(cells: [
                  DataCell(Text('0002')),
                  DataCell(Text('2')),
                  DataCell(Text('1')),
                ]),
                DataRow(cells: [
                  DataCell(Text('0003')),
                  DataCell(Text('2')),
                  DataCell(Text('1')),
                ]),
                DataRow(cells: [
                  DataCell(Text('0004')),
                  DataCell(Text('2')),
                  DataCell(Text('1')),
                ]),
                DataRow(cells: [
                  DataCell(Text('0001')),
                  DataCell(Text('2')),
                  DataCell(Text('1')),
                ]),
                DataRow(cells: [
                  DataCell(Text('0002')),
                  DataCell(Text('2')),
                  DataCell(Text('1')),
                ]),
                DataRow(cells: [
                  DataCell(Text('0003')),
                  DataCell(Text('2')),
                  DataCell(Text('1')),
                ]),
                DataRow(cells: [
                  DataCell(Text('0004')),
                  DataCell(Text('2')),
                  DataCell(Text('1')),
                ]),
                DataRow(cells: [
                  DataCell(Text('0001')),
                  DataCell(Text('2')),
                  DataCell(Text('1')),
                ]),
                DataRow(cells: [
                  DataCell(Text('0002')),
                  DataCell(Text('2')),
                  DataCell(Text('1')),
                ]),
                DataRow(cells: [
                  DataCell(Text('0003')),
                  DataCell(Text('2')),
                  DataCell(Text('1')),
                ]),
                DataRow(cells: [
                  DataCell(Text('0004')),
                  DataCell(Text('2')),
                  DataCell(Text('1')),
                ]),
              ])
            ],
          ),
        ),
      );
}

    /* // final double _borderRadius = 24;
  List<String> events = [
    "Perkembangan Motor Kasar",
    "Perkembangan Motor Halus dan Kemahiran Pra-menulis",
    "Penilaian Kemahiran Melakukan Aktiviti Kehidupan Harian(ADL)",
    "Penilaian Social dan Kognitif",
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text('Domain'),
          centerTitle: true,
          backgroundColor: const Color(0XFF40E0D0),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
          ),
          child: (Container(
            margin: const EdgeInsets.only(top: 10),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView(
                //physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10),
                children: events.map((title) {
                  //loop item
                  return GestureDetector(
                    child: Card(
                      margin: const EdgeInsets.only(top: 20),
                      child: getCardByTitle(title),
                    ),
                  );
                }).toList(),
              ),
            ),
          )),
        ),
      );
    );
  }
}     
          
}

Column getCardByTitle(String title) {
  String img = "";
  if (title == "Perkembangan Motor Kasar") {
    img = "assets/motorkasar.jpg";
  } else if (title == "Perkembangan Motor Halus dan Kemahiran Pra-menulis") {
    img = "assets/motorhalus.jpg";
  } else if (title ==
      "Penilaian Kemahiran Melakukan Aktiviti Kehidupan Harian(ADL)") {
    img = "assets/adl.jpg";
  } else if (title == "Penilaian Social dan Kognitif") {
    img = "assets/kognitif.jpg";
  }

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      new Center(
        child: new Stack(
          children: <Widget>[
            ClipOval(
              child: new Image.asset(
                img,
                width: 100,
                height: 100,
              ),
            )
          ],
        ),
      ),
      Text(
        title,
        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      )
    ],
   
  );*/
