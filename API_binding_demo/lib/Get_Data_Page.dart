import 'dart:developer';

import 'package:api_binding_demo/Api_Binding.dart';
import 'package:api_binding_demo/IndividualPage.dart';
import 'package:flutter/material.dart';

class GetDataPage extends StatefulWidget {
  const GetDataPage({super.key});

  @override
  State<GetDataPage> createState() => _GetDataPageState();
}

class _GetDataPageState extends State<GetDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Display Data",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        shape:
            const Border(bottom: BorderSide(width: 0.5, color: Colors.black)),
        shadowColor: Colors.white,
        elevation: 5.0,
      ),
      body: ListView.builder(
        itemCount: getDataList?.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              log("in listview builder");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Individualpage(index: index)));
            },
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(
                    imagesList[index],
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  getDataList?[index]['name'],
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
