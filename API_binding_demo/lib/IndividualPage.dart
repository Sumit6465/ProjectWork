import 'package:api_binding_demo/Api_Binding.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Individualpage extends StatefulWidget {
  int index = 0;

  Individualpage({super.key, required this.index});

  @override
  State<Individualpage> createState() => _IndividualpageState();
}

class _IndividualpageState extends State<Individualpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 400,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                imagesList[widget.index],
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              getDataList?[widget.index]['name'],
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              "Color: ${getDataList != null && getDataList![widget.index]['data'] != null && getDataList![widget.index]['data']['color'] != null ? getDataList![widget.index]['data']['color'] : 'N/A'}",
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              "capacity: ${getDataList != null && getDataList![widget.index]['data'] != null && getDataList![widget.index]['data']['capacity'] != null ? getDataList![widget.index]['data']['capacity'] : 'N/A'}",
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
