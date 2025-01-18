// import "package:flutter/material.dart";
// import "package:flutter_svg/svg.dart";
// import "package:to_do_page1/bottomsheet.dart";

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State createState() => _MyAppState();
// }

// class _MyAppState extends State {
//   List<Color?> todolistcolor = [
//     Colors.green[50],
//     Colors.blue[50],
//     Colors.yellow[50],
//     Colors.pink[50]
//   ];
//   List L1 = [];
//   int index1 = 0;
//   int x = 0;

//   Color? changecolor(int index) {
//     if (index1 != -1) {
//       if (index - 1 % 4 == 0) {
//         return todolistcolor[index - 1];
//       } else if (index - 1 % 4 == 1) {
//         return todolistcolor[index - 1];
//       } else if (index - 1 % 4 == 2) {
//         return todolistcolor[index - 1];
//       } else if (index - 1 % 4 == 3) {
//         return todolistcolor[index - 1];
//       } else {
//         return null;
//       }
//     } else {
//       return null;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//           appBar: AppBar(
//             title: const Text(
//               "To-do list",
//               style: TextStyle(
//                   fontSize: 26,
//                   fontWeight: FontWeight.w700,
//                   color: Colors.white),
//             ),
//             backgroundColor: const Color.fromRGBO(2, 167, 177, 1),
//           ),
//           body: Column(
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   //padding: EdgeInsets.all(10),
//                   itemCount: x,
//                   shrinkWrap: true,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: Container(
//                         height: 130,
//                         width: 330,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: changecolor(index),
//                         ),
//                         child: Column(
//                           children: [
//                             Row(
//                               children: [
//                                 const SizedBox(
//                                   width: 90,
//                                 ),
//                                 Container(
//                                   padding: const EdgeInsets.all(5),
//                                   child: const Text(
//                                     "Lorem Ipsum is simply setting industry.",
//                                     style: TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Container(
//                                   padding: const EdgeInsets.all(15),
//                                   margin: const EdgeInsets.only(
//                                       left: 15, right: 20, bottom: 15),
//                                   width: 60,
//                                   height: 60,
//                                   decoration: const BoxDecoration(
//                                       color: Colors.white,
//                                       shape: BoxShape.circle),
//                                   child: SvgPicture.asset(
//                                     "assets/svg/image_svg.svg",
//                                   ),
//                                 ),
//                                 Container(
//                                   height: 60,
//                                   width: 280,
//                                   child: const Text(
//                                     "Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
//                                     style: TextStyle(
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w500,
//                                         color: Color.fromRGBO(84, 84, 84, 1)),
//                                   ),
//                                 )
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                                 const Padding(
//                                   padding: EdgeInsets.only(top: 1),
//                                   child: Text(
//                                     "09 July 2024",
//                                     style: TextStyle(
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w500,
//                                         color:
//                                             Color.fromRGBO(132, 132, 132, 1)),
//                                   ),
//                                 ),
//                                 const Spacer(),
//                                 SvgPicture.asset("assets/svg/edit_svg.svg"),
//                                 const SizedBox(
//                                   width: 20,
//                                 ),
//                                 SvgPicture.asset("assets/svg/bin_svg.svg"),
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               )
//             ],
//           ),
//           floatingActionButton: FloatingActionButton(
//             onPressed: () {
//               if (index1 < 3) {
//                 index1++;
//               } else {
//                 index1 = 0;
//               }
//               x++;
//               const MyHomePage();
//               setState(() {});
//               //todolistcolor = todolistcolor[index];
//             },
//             child: const Icon(Icons.add),
//           )),
//     );
//   }
// }

import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My App",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController txt_for_name = TextEditingController();
  TextEditingController txt_for_description = TextEditingController();

  void openBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            //mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).viewInsets.bottom,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.black))),
                child: const Center(
                  child: Text(
                    "BottomSheet",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: const Text(
                  "Name:",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: txt_for_name,
                  decoration: const InputDecoration(
                      hintText: "Enter your Name",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                //height: MediaQuery.of(context).viewInsets.bottom,
                padding: const EdgeInsets.only(left: 20),
                child: const Text(
                  "Description:",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Container(
                //height: MediaQuery.of(context).viewInsets.top,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                    controller: txt_for_description,
                    decoration: const InputDecoration(
                      hintText: "Write here ...",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2)),
                    )
                    //labelText: "Write down"),
                    ),
              ),

              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 55,
                  ),
                  GestureDetector(
                    onTap: () {
                      l1.add({
                        "name": txt_for_name.text,
                        "description": txt_for_description.text
                      });
                      // index1++;
                      if (index1 < 3) {
                        index1++;
                      } else {
                        index1 = 0;
                      }
                      txt_for_description.clear();
                      txt_for_name.clear();
                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 20),
                      height: 50,
                      width: 300,
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // CalendarDatePicker(initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2100) ),
            ],
          );
        });
  }

  List<Color?> todolistcolor = [
    Colors.green[50],
    Colors.blue[50],
    Colors.yellow[50],
    Colors.pink[50]
  ];
  List<Map> l1 = [];
  int index1 = -1;
  int x = -1;

  Color? changecolor(int index) {
    if (index % 4 == 0) {
      return todolistcolor[0];
    } else if (index % 4 == 1) {
      return todolistcolor[1];
    } else if (index % 4 == 2) {
      return todolistcolor[2];
    } else if (index % 4 == 3) {
      return todolistcolor[3];
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.abc_rounded,
                    ),
                    Icon(
                      Icons.abc_rounded,
                    ),
                    Icon(
                      Icons.abc_rounded,
                    ),
                    Icon(
                      Icons.abc_rounded,
                    ),
                  ],
                ),
              )
            ],
            title: const Text(
              "To-do list",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            backgroundColor: const Color.fromRGBO(2, 167, 177, 1),
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  //padding: EdgeInsets.all(10),
                  itemCount: l1.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 130,
                        width: 330,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: changecolor(index),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const SizedBox(
                                  width: 90,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    l1[index]["name"],
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  margin: const EdgeInsets.only(
                                      left: 15, right: 20, bottom: 15),
                                  width: 60,
                                  height: 60,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                  child: SvgPicture.asset(
                                    "assets/svg/image_svg.svg",
                                  ),
                                ),
                                Container(
                                  height: 60,
                                  width: 280,
                                  child: Text(
                                    l1[index]["description"],
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(84, 84, 84, 1)),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 1),
                                  child: Text(
                                    "09 July 2024",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromRGBO(132, 132, 132, 1)),
                                  ),
                                ),
                                const Spacer(),
                                SvgPicture.asset("assets/svg/edit_svg.svg"),
                                const SizedBox(
                                  width: 20,
                                ),
                                SvgPicture.asset("assets/svg/bin_svg.svg"),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              //x++;
              openBottomSheet();
              setState(() {});
              //todolistcolor = todolistcolor[index];
            },
            child: const Icon(Icons.add),
          )),
    );
  }
}
