// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:golf/widget/navigation_drawer.dart';

class domain extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Domain'),
        centerTitle: true,
        backgroundColor: Color(0XFF40E0D0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            InkWell(
              child: Container(
                child: Card(
                  child: Column(
                    children: [
                      ClipOval(
                        child: Image(
                          image: AssetImage("assets/motorkasar.png"),
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text("Perkembangan Motor Kasar")
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => domain()));
              },
            ),
            InkWell(
              child: Container(
                child: Card(
                  child: Column(
                    children: [
                      ClipOval(
                        child: Image(
                          image: AssetImage("assets/motorhaluss.png"),
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Perkembangan Motor Halus dan Kemahiran Pra-menulis",
                          //overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => domain()));
              },
            ),
            InkWell(
              child: Container(
                child: Card(
                  child: Column(
                    children: [
                      ClipOval(
                        child: Image(
                          image: AssetImage(""),
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Kemahiran Melakukan Aktiviti Harian(ADL)",
                          //overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => domain()));
              },
            ),
            InkWell(
              child: Container(
                child: Card(
                  child: Column(
                    children: [
                      ClipOval(
                        child: Image(
                          image: AssetImage(""),
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text("Sosial dan Kognitif")
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => domain()));
              },
            ),
          ],
        ),
      ));
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
