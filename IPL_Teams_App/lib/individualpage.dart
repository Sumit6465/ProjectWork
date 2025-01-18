import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:iplteams/main.dart';

class Individualpage extends StatefulWidget {
  String? individualTeam;

  Individualpage({super.key, required this.individualTeam});

  @override
  State<Individualpage> createState() => _IndividualpageState();
}

List displayList = [];

class _IndividualpageState extends State<Individualpage> {
  @override
  void initState() {
    super.initState();
    if (widget.individualTeam == "CSK" || widget.individualTeam == "csk") {
      displayList = cskplayerlist;
    } else if (widget.individualTeam == "MI" || widget.individualTeam == "mi") {
      displayList = miplayerlist;
    } else if (widget.individualTeam == "DC" || widget.individualTeam == "dc") {
      displayList = dcplayerlist;
    } else if (widget.individualTeam == "GT" || widget.individualTeam == "gt") {
      displayList = gtplayerlist;
    } else if (widget.individualTeam == "KKR" ||
        widget.individualTeam == "kkr") {
      displayList = kkrplayerlist;
    } else if (widget.individualTeam == "LSG" ||
        widget.individualTeam == "lsg") {
      displayList = lsgplayerlist;
    } else if (widget.individualTeam == "PBKS" ||
        widget.individualTeam == "pbks") {
      displayList = pbksplayerlist;
    } else if (widget.individualTeam == "RCB" ||
        widget.individualTeam == "rcb") {
      displayList = rcbplayerlist;
    } else if (widget.individualTeam == "RR" || widget.individualTeam == "rr") {
      displayList = rrplayerlist;
    } else if (widget.individualTeam == "srh" ||
        widget.individualTeam == "SRH") {
      displayList = srhplayerlist;
    }

    log("Aloi");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: displayList.length,
          itemBuilder: (context, index) {
            return Container(
                child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                    width: 300,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Colors.black, Colors.grey],
                            end: Alignment.center,
                            begin: Alignment.bottomRight),
                        borderRadius: BorderRadius.circular(20),
                        border: const Border(
                            bottom: BorderSide(width: 1),
                            top: BorderSide(width: 1),
                            right: BorderSide(width: 1),
                            left: BorderSide(width: 1))),
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            //color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(displayList[index]['url']),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          displayList[index]['playerName'],
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          displayList[index]['jerseyNo'],
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ))
              ],
            ));
          },
        ),
      ),
    );
  }
}
