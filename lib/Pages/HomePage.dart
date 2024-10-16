import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todomate/Pages/SignUpPage.dart';

import '../Service/Auth_service.dart';
import 'TodoBottom.dart';
import 'TodoCard.dart';
import 'ViewDetails.dart';
import 'addtask.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Authclass authClass = Authclass();
  final Stream<QuerySnapshot> _stream =
      FirebaseFirestore.instance.collection("Todo").snapshots();

  @override
  Widget build(BuildContext context) {
    var time = DateTime.now();
    var time2 = DateFormat('dd MMMM yyyy').format(time);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff003366),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            children: [
              Text(
                time2,
                style:
                    const TextStyle(fontFamily: "Poppins", color: Colors.white),
              ),
              const Text(
                "My Todo List",
                style: TextStyle(
                  fontFamily: "Poppins",
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        toolbarHeight: 120,
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: IconButton(
                onPressed: () async {
                  await authClass.logout();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => const SignUpPage()),
                      (route) => false);
                },
                icon: const Icon(
                  Icons.logout_rounded,
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xff003366)),
            );
          }
          if (snapshot.data?.docs.isEmpty ?? true) {
            return const Padding(
              padding: EdgeInsets.only(top: 250, left: 80),
              child: Column(
                children: [
                  CircularProgressIndicator(color: Color(0xff003366)),
                  SizedBox(height: 10),
                  Text(
                    "No Data Available",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 20,
                      color: Color(0xff003366),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }
          return Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> data =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>;
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: ViewDetails(
                                data: data, id: snapshot.data!.docs[index].id),
                            type: PageTransitionType.rightToLeft)
                        // MaterialPageRoute(
                        //   builder: (builder) => ViewDetails(
                        //     data: data,
                        //     id: snapshot.data!.docs[index].id,
                        //   ),
                        // ),
                        );
                  },
                  onLongPress: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: Color(0xff003366),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                          child: TodoBottom(
                            data["title"],
                            data["date"],
                            data["time"],
                            data["category"],
                            data["note"],
                          ),
                        );
                      },
                    );
                  },
                  child: TodoCard(
                    data["title"],
                    data["date"],
                    data["time"],
                    data["category"],
                  ),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                  child: const AddTask(), type: PageTransitionType.bottomToTop),
            );
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xff003366),
            ),
            child: const Center(
              child: Text(
                "Add new Task",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                  fontSize: 30,
                  letterSpacing: 1.3,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
