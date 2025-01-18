import 'dart:developer';

import 'package:api_binding_demo/Api_Binding.dart';
import 'package:flutter/material.dart';

class PostDataClass extends StatefulWidget {
  const PostDataClass({super.key});

  @override
  State<PostDataClass> createState() => _PostDataClassState();
}

class _PostDataClassState extends State<PostDataClass> {
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  TextEditingController txt3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Post Data",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        shape:
            const Border(bottom: BorderSide(width: 0.5, color: Colors.black)),
        shadowColor: Colors.white,
        elevation: 5.0,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              controller: txt1,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                hintText: "Enter Device Name",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black)),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              controller: txt2,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                hintText: "Enter Device color",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black)),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              controller: txt3,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                hintText: "Enter Device capacity",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black)),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                      Color.fromARGB(255, 236, 198, 210))),
              onPressed: () {
                if (txt1.text.trim().isNotEmpty &&
                    txt2.text.trim().isNotEmpty &&
                    txt3.text.trim().isNotEmpty) {
                  postList.addAll(
                    {
                      "name": txt1.text,
                      "data": {"color": txt2.text, "capacity": txt3.text}
                    },
                  );
                  postMyData();
                  txt1.clear();
                  txt2.clear();
                  txt3.clear();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Please enter valid feilds")));
                }
                log("$postList");
              },
              child: const Text(
                "Post Data",
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
    );
  }
}
