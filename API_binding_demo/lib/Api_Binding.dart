import 'dart:convert';
import 'dart:developer';

import 'package:api_binding_demo/Get_Data_Page.dart';
import 'package:api_binding_demo/Post_Data.dart';
import 'package:api_binding_demo/Update_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyDemoApp extends StatefulWidget {
  const MyDemoApp({super.key});

  @override
  State<MyDemoApp> createState() => _MyDemoAppState();
}

Map<dynamic, dynamic> postList = {};
void postMyData() async {
  Uri url = Uri.parse("https://api.restful-api.dev/objects");
  Map<String, String> headers = {
    "Content-Type": "application/json",
    //"Authorization": "Bearer <your_token_here>", // If authentication is required
  };

  http.Response response = await http.post(
    url,
    headers: headers,
    body: jsonEncode(postList),
  );

  log(response.body);
}

// void updateMyData() async {
//   Uri url = Uri.parse(
//       "https://api.restful-api.dev/objects/ff808181932badb601945596ae2018f2");
//   Map<String, String> headers = {
//     "Content-Type": "application/json",
//     //"Authorization": "Bearer <your_token_here>", // If authentication is required
//   };

//   http.Response response = await http.put(
//     url,
//     headers: headers,
//     body: jsonEncode(postList),
//   );

//   log(response.body);
// }

void updateMyData(Map<String, dynamic> postList, String id) async {
  Uri url = Uri.parse("https://api.restful-api.dev/objects/$id");
  Map<String, String> headers = {
    "Content-Type": "application/json",
    // "Authorization": "Bearer <your_token_here>", // Uncomment if required
  };

  try {
    http.Response response = await http.patch(
      url,
      headers: headers,
      body: jsonEncode(postList),
    );

    if (response.statusCode == 200) {
      log("Update successful: ${response.body}");
    } else {
      log("Error: ${response.statusCode} - ${response.reasonPhrase}");
      log("Response body: ${response.body}");
    }
  } catch (e) {
    log("An error occurred: $e");
  }
}

List<dynamic>? getDataList = [];
List imagesList = [
  "https://m.media-amazon.com/images/I/61ruKkvVIxL.jpg",
  "https://5.imimg.com/data5/SELLER/Default/2021/1/CE/HB/PL/14753644/iphone-12-mini-1-500x500.jpg",
  "https://m.media-amazon.com/images/I/71XXJC7V8tL.jpg",
  "https://www.aptronixindia.com/pub/media/catalog/product/i/p/iphone1164gbpurple_2.png",
  "https://easy-buy.in/wp-content/uploads/2022/12/New-Project-59.webp",
  "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/airpods-pro-2-hero-select-202409_FV1_FMT_WHH?wid=752&hei=636&fmt=jpeg&qlt=90&.v=1725492498882",
  "https://iplanet.one/cdn/shop/files/MacBook_Pro_16-in_Space_Gray_PDP_Image_Position-1__GBEN_694c2083-9226-40df-a34a-7868914daff4.jpg?v=1691143292",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2HSgXz45kOFFMWtViLC0PS2dmqofJZmkm_Q&s",
  "https://m.media-amazon.com/images/I/618aVzbPMjL._AC_UF1000,1000_QL80_.jpg",
  "https://images-cdn.ubuy.co.in/668b33ddf727917e7726b645-restored-apple-ipad-5th-generation-32gb.jpg",
  "https://images-cdn.ubuy.co.in/668b33ddf727917e7726b645-restored-apple-ipad-5th-generation-32gb.jpg",
  "https://www.jiomart.com/images/product/original/494404942/apple-ipad-air-6th-gen-2024-27-59-cm-11-inch-wi-fi-tablet-128-gb-blue-digital-o494404942-p608933212-1-202405082001.jpeg?im=Resize=(420,420)",
  "https://www.jiomart.com/images/product/original/494404942/apple-ipad-air-6th-gen-2024-27-59-cm-11-inch-wi-fi-tablet-128-gb-blue-digital-o494404942-p608933212-1-202405082001.jpeg?im=Resize=(420,420)"
];

class _MyDemoAppState extends State<MyDemoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            "API BINDING",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 3, 3, 3),
          shape:
              const Border(bottom: BorderSide(width: 0.5, color: Colors.white)),
          shadowColor: Colors.white,
          elevation: 5.0,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 70,
                ),
                GestureDetector(
                  onTap: () {
                    getAllData();
                  },
                  child: Container(
                    height: 70,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(color: Colors.white, blurRadius: 10.0)
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "Get Data",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 65,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PostDataClass()));
                  },
                  child: Container(
                    height: 70,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(color: Colors.white, blurRadius: 10.0)
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "Post Data",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 70,
                ),
                GestureDetector(
                  onTap: () {
                    log("In update data");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UpdateDataClass()));
                  },
                  child: Container(
                    height: 70,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(color: Colors.white, blurRadius: 10.0)
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "Update Data",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 65,
                ),
                Container(
                  height: 70,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(color: Colors.white, blurRadius: 10.0)
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      "Delete Data",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }

  void getAllData() async {
    Uri url = Uri.parse("https://api.restful-api.dev/objects");
    log("in getdata");

    http.Response response = await http.get(url);
    getDataList = json.decode(response.body);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const GetDataPage()));

    log(response.body);
  }
}
