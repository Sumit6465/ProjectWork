import 'package:flutter/material.dart';
import 'package:iplteams/individualpage.dart';
import 'package:iplteams/main.dart';

class Teams extends StatefulWidget {
  const Teams({super.key});

  @override
  State<Teams> createState() => _TeamsState();
}

List teamsName = [
  "assets/images/CSK.webp",
  "assets/images/DC.jpg",
  "assets/images/GT.jpg",
  "assets/images/KKR.jpg",
  "assets/images/LSG.jpg",
  "assets/images/MI.jpg",
  "assets/images/PUNJAB.jpg",
  "assets/images/RCB.jpg",
  "assets/images/RR.png",
  "assets/images/SRH.jpg"
];

class _TeamsState extends State<Teams> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "IPL Teams",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 0, // Horizontal spacing
            mainAxisSpacing: 0, // Vertical spacing
          ),
          itemCount: 10, // Number of items
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: () {
                  String myTeam = teamList[index];
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Individualpage(
                                individualTeam: myTeam,
                              )));
                },
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.asset(
                    teamsName[index],
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
