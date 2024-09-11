import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'HomePage.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController tasktitlecontroller = TextEditingController();
  TextEditingController taskdatecontroller = TextEditingController();
  TextEditingController tasktimecontroller = TextEditingController();
  TextEditingController tasknotecontroller = TextEditingController();
  String category = "";
  bool _validateInputs() {
    if (tasktitlecontroller.text.isEmpty &&
        taskdatecontroller.text.isEmpty &&
        tasktimecontroller.text.isEmpty &&
        category.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill at least one field'),
        ),
      );
      return false;
    }
    return true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff003366),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => HomePage()));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const Text(
          "Add a Task",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            //task title
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Title",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: tasktitlecontroller,
                  cursorColor: Colors.green,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: "Task Title",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: Colors.blueGrey, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: Colors.blueGrey, width: 2)),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 1),
                child: Row(
                  children: [
                    const Text("Category",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        chipdata("Travel", 0xff0A6B61),
                        const SizedBox(
                          width: 5,
                        ),
                        chipdata("Health", 0xff0A6B2C),
                        const SizedBox(
                          width: 5,
                        ),
                        chipdata("Office", 0xff400C5A),
                        const SizedBox(
                          width: 5,
                        ),
                        chipdata("Personal", 0xffA93226),
                        const SizedBox(
                          width: 5,
                        ),
                        chipdata("Finance", 0xff696B0A),
                      ],
                    ))
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Date",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: taskdatecontroller,
                        cursorColor: Colors.green,
                        maxLines: 1,
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: "Select date",
                          suffixIcon: IconButton(
                            onPressed: () {
                              _selectDate();
                            },
                            icon: const Icon(Icons.date_range),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.blueGrey, width: 2)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.blueGrey, width: 2)),
                        ),
                      )
                    ],
                  ),

                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Time",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: tasktimecontroller,
                        cursorColor: Colors.green,
                        maxLines: 1,
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: "Select time",
                          suffixIcon: IconButton(
                            onPressed: () {
                              _selectTime();
                            },
                            icon: const Icon(Icons.access_time),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.blueGrey, width: 2)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.blueGrey, width: 2)),
                        ),
                      )
                    ],
                  ),

                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Note",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: tasknotecontroller,
                  cursorColor: Colors.green,
                  maxLines: 8,
                  decoration: InputDecoration(
                    hintText: "Task Note",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: Colors.blueGrey, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: Colors.blueGrey, width: 2)),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            if (_validateInputs()) {
              FirebaseFirestore.instance.collection("Todo").add({
                "title": tasktitlecontroller.text,
                "category": category,
                "date": taskdatecontroller.text,
                "time": tasktimecontroller.text,
                "note": tasknotecontroller.text,
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            }
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xff003366)),
            child: const Center(
                child: Text(
              "Save",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                  fontSize: 30,
                  letterSpacing: 1.3),
            )),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (picked != null) {
      setState(() {
        taskdatecontroller.text = DateFormat('dd MMMM yyyy').format(picked);
      });
    }
  }

  Future<void> _selectTime() async {
    TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null) {
      setState(() {
        tasktimecontroller.text = picked.format(context).toString();
      });
    }
  }

  Widget chipdata(String label, int color) {
    return InkWell(
      onTap: () {
        setState(() {
          category = label;
        });
      },
      child: Chip(
        backgroundColor: category == label ? Color(color) : Color(color).withOpacity(0.3),
        side: const BorderSide(color: Colors.transparent),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        label: Text(label),
        labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: "Poppins",
            color: category == label ? Colors.white : Colors.white),
      ),
    );
  }
}
