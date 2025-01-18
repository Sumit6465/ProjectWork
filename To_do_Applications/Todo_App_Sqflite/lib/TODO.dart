import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoadvancelevel_app/Modal.dart';
import 'package:todoadvancelevel_app/main.dart';

class MyToDoApp extends StatefulWidget {
  @override
  State createState() => _MyToDoApp();
}

class _MyToDoApp extends State {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  DateTime? selecteddate;
  bool isEdit = false;

  Future<void> selectDate() async {
    DateTime? pickDate = await showDatePicker(
        context: context, firstDate: DateTime(2000), lastDate: DateTime(3000));
    if (pickDate != null && pickDate != selecteddate) {
      dateController.text = "$pickDate".split(' ')[0];
    }
  }

  // void initState() {
  //   super.initState();
  //   demogetdata();
  // }

  // void demogetdata() async {
  //   await getData();
  // }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getData();
  }

  void submitData(Todo obj1) async {
    if (isEdit) {
      insertData(obj1);
    } else {
      updateData(obj1);
      await getData();
    }
  }

  void bottomSheetCall() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 10,
                right: 10,
                top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 130,
                    ),
                    Container(
                      child: const Text(
                        "Create To Do",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Title",
                  style: GoogleFonts.quicksand(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(89, 57, 241, 1),
                  ),
                ),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 2))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Description",
                  style: GoogleFonts.quicksand(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(89, 57, 241, 1),
                  ),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 2))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Date",
                  style: GoogleFonts.quicksand(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(89, 57, 241, 1),
                  ),
                ),
                TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                          onTap: () {
                            selectDate();
                            setState(() {});
                          },
                          child: const Icon(Icons.date_range_outlined)),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 2))),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    height: 50,
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (isEdit == false) {
                          Todo obj1 = Todo(
                              name: nameController.text,
                              description: descriptionController.text,
                              date: dateController.text);
                          submitData(obj1);

                          print(await getData());
                          nameController.clear();
                          descriptionController.clear();
                          dateController.clear();
                          Navigator.pop(context);
                        } else {
                          log("Reached in Update data");
                          Todo obj1 = Todo(
                              name: nameController.text,
                              description: descriptionController.text,
                              date: dateController.text);
                          updateData(obj1);
                          nameController.clear();
                          descriptionController.clear();
                          dateController.clear();
                          Navigator.pop(context);
                        }
                      },
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            Color.fromRGBO(89, 57, 241, 1)),
                      ),
                      child: Text(
                        "Submit",
                        style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          );
        });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: const Color.fromRGBO(111, 81, 255, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 45),
                child: Text(
                  "Good morning",
                  style: GoogleFonts.quicksand(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                ),
                child: Text(
                  "Sumit",
                  style: GoogleFonts.quicksand(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(217, 217, 217, 1),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Center(
                              child: Text("CREATE TO DO LIST",
                                  style: GoogleFonts.quicksand(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ))),
                        ),
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40))),

                            //color: Color.fromRGBO(217, 217, 217, 1),
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: allData.length,
                              itemBuilder: (context, index) {
                                return Slidable(
                                  endActionPane: ActionPane(
                                      motion: const ScrollMotion(),
                                      children: [
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              children: [
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  height: 40,
                                                  width: 40,
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Color.fromARGB(
                                                              255,
                                                              144,
                                                              124,
                                                              245)),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      isEdit = true;
                                                      nameController.text =
                                                          allData[index]
                                                              ['name'];
                                                      descriptionController
                                                              .text =
                                                          allData[index]
                                                              ['description'];
                                                      dateController.text =
                                                          allData[index]
                                                              ['date'];
                                                      setState(() {});

                                                      // Todo updateObject = Todo(
                                                      //     name: nameController
                                                      //         .text,
                                                      //     description:
                                                      //         descriptionController
                                                      //             .text,
                                                      //     date: dateController
                                                      //         .text);
                                                      bottomSheetCall();
                                                    },
                                                    child: const Icon(
                                                      Icons.edit,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  height: 40,
                                                  width: 40,
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Color.fromARGB(
                                                              255,
                                                              144,
                                                              124,
                                                              245)),
                                                  child: const Icon(
                                                    Icons.delete,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 100,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 12,
                                                spreadRadius: 0,
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.16))
                                          ]),
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                            height: 60,
                                            width: 60,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: SvgPicture.asset(
                                                "assets/svg/image_svg.svg",
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  allData[index]['name'],
                                                  style: GoogleFonts.inter(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  allData[index]['description'],
                                                  style: GoogleFonts.inter(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          const Color.fromRGBO(
                                                              0, 0, 0, 0.7)),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  allData[index]['date'],
                                                  style: GoogleFonts.inter(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color:
                                                          const Color.fromRGBO(
                                                              0, 0, 0, 0.7)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              setState(() {});
              bottomSheetCall();
            });
          },
          backgroundColor: const Color.fromARGB(255, 144, 124, 245),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
