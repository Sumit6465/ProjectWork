import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iplteams/modalclass.dart';
import 'package:iplteams/teams.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBp4Gs8VXo9tIrv5g7ZX_BcGQOqtkXCk0g",
          appId: "1:422835842108:android:bf45b4679931a295456739",
          messagingSenderId: "422835842108",
          projectId: "farmfreshpro-d9129",
          storageBucket: "farmfreshpro-d9129.appspot.com"));
  runApp(const MainApp());
}
List<List> allTeams=[cskplayerlist,dcplayerlist,gtplayerlist,kkrplayerlist,lsgplayerlist,miplayerlist,pbksplayerlist,rcbplayerlist,rrplayerlist,srhplayerlist];

List<Map> cskplayerlist = [];
List<Map> miplayerlist = [];
List<Map> srhplayerlist = [];
List<Map> rrplayerlist = [];
List<Map> dcplayerlist = [];
List<Map> pbksplayerlist = [];
List<Map> rcbplayerlist = [];
List<Map> gtplayerlist = [];
List<Map> kkrplayerlist = [];
List<Map> lsgplayerlist = [];
List teamList = [
  "CSK",
  "DC",
  "GT",
  "KKR",
  "LSG",
  "MI",
  "PBKS",
  "RCB",
  "RR",
  "SRH"
];

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: IPLTeams());
  }
}

class IPLTeams extends StatefulWidget {
  const IPLTeams({super.key});

  @override
  State<IPLTeams> createState() => _IPLTeamsState();
}

class _IPLTeamsState extends State<IPLTeams> {
  TextEditingController playerName = TextEditingController();
  TextEditingController jerNo = TextEditingController();
  TextEditingController teamName = TextEditingController();

  ImagePicker imagePicker = ImagePicker();
  XFile? selectedfile;
  String? url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Player Data",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () async {
                selectedfile =
                    await imagePicker.pickImage(source: ImageSource.gallery);

                setState(() {});
              },
              child: Container(
                  height: 150,
                  width: 150,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: (selectedfile == null)
                      ? Image.network(
                          "https://img.freepik.com/premium-vector/cricket-player-mascot-batsman_945378-3.jpg")
                      : Image.file(File(selectedfile!.path))),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: playerName,
                decoration: const InputDecoration(
                    hintText: "Enter PlayerName",
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 0.5))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: jerNo,
                decoration: const InputDecoration(
                    hintText: "Enter jerseyNo",
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 0.5))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: teamName,
                decoration: const InputDecoration(
                    hintText: "Enter IPLTeam",
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 0.5))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 60,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (playerName.text.trim().isNotEmpty &&
                        jerNo.text.trim().isNotEmpty &&
                        teamName.text.trim().isNotEmpty) {
                      await FirebaseStorage.instance
                          .ref()
                          .child(playerName.text)
                          .putFile(File(selectedfile!.path));
                      url = await FirebaseStorage.instance
                          .ref()
                          .child(playerName.text)
                          .getDownloadURL();
                      log(url!);
                      log("yetai");
                      Map<String, dynamic> data = {
                        "playerName": playerName.text.trim(),
                        "jerseyNo": jerNo.text.trim(),
                        "teamName": teamName.text.trim(),
                        "url": url,
                      };
                      await FirebaseFirestore.instance
                          .collection("IPLPlayers")
                          .doc("Franchise")
                          .collection("${teamName.text.trim()}")
                          .add(data);

                      playerName.clear();
                      jerNo.clear();
                      teamName.clear();
                      selectedfile = null;
                    }
                  },
                  child: const Text("Add Data"),
                ),
                const SizedBox(
                  width: 60,
                ),
                ElevatedButton(
                    onPressed: () async {
                      cskplayerlist.clear();
                      miplayerlist.clear();
                      rrplayerlist.clear();
                      rcbplayerlist.clear();
                      dcplayerlist.clear();
                      gtplayerlist.clear();
                      kkrplayerlist.clear();
                      lsgplayerlist.clear();
                      pbksplayerlist.clear();
                      srhplayerlist.clear();
                      for (String team in teamList) {
                        QuerySnapshot response = await FirebaseFirestore
                            .instance
                            .collection("IPLPlayers")
                            .doc("Franchise")
                            .collection(team)
                            .get();
                        for (var doc in response.docs) {
                          if (team == "CSK" || team == "csk") {
                            cskplayerlist.add({
                              'playerName': doc['playerName'],
                              'jerseyNo': doc['jerseyNo'],
                              'IPLTeam': doc["teamName"],
                              'url': doc["url"],
                            });
                          } else if (team == "MI" || team == "mi") {
                            miplayerlist.add({
                              'playerName': doc['playerName'],
                              'jerseyNo': doc['jerseyNo'],
                              'IPLTeam': doc["teamName"],
                              'url': doc["url"],
                            });
                          } else if (team == "DC" || team == "dc") {
                            miplayerlist.add({
                              'playerName': doc['playerName'],
                              'jerseyNo': doc['jerseyNo'],
                              'IPLTeam': doc["teamName"],
                              'url': doc["url"],
                            });
                          } else if (team == "GT" || team == "gt") {
                            miplayerlist.add({
                              'playerName': doc['playerName'],
                              'jerseyNo': doc['jerseyNo'],
                              'IPLTeam': doc["teamName"],
                              'url': doc["url"],
                            });
                          } else if (team == "KKR" || team == "kkr") {
                            miplayerlist.add({
                              'playerName': doc['playerName'],
                              'jerseyNo': doc['jerseyNo'],
                              'IPLTeam': doc["teamName"],
                              'url': doc["url"],
                            });
                          } else if (team == "LSG" || team == "lsg") {
                            miplayerlist.add({
                              'playerName': doc['playerName'],
                              'jerseyNo': doc['jerseyNo'],
                              'IPLTeam': doc["teamName"],
                              'url': doc["url"],
                            });
                          } else if (team == "PBKS" || team == "pbks") {
                            miplayerlist.add({
                              'playerName': doc['playerName'],
                              'jerseyNo': doc['jerseyNo'],
                              'IPLTeam': doc["teamName"],
                              'url': doc["url"],
                            });
                          } else if (team == "RCB" || team == "rcb") {
                            miplayerlist.add({
                              'playerName': doc['playerName'],
                              'jerseyNo': doc['jerseyNo'],
                              'IPLTeam': doc["teamName"],
                              'url': doc["url"],
                            });
                          } else if (team == "RR" || team == "rr") {
                            miplayerlist.add({
                              'playerName': doc['playerName'],
                              'jerseyNo': doc['jerseyNo'],
                              'IPLTeam': doc["teamName"],
                              'url': doc["url"],
                            });
                          } else if (team == "srh" || team == "SRH") {
                            miplayerlist.add({
                              'playerName': doc['playerName'],
                              'jerseyNo': doc['jerseyNo'],
                              'IPLTeam': doc["teamName"],
                              'url': doc["url"],
                            });
                          }
                        }
                      }

                      log("$cskplayerlist");
                      log("$miplayerlist");

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Teams()));
                    },
                    child: const Text("Get Data"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
