import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:todomate/Pages/HomePage.dart';
import 'package:todomate/Pages/SignInPage.dart';

import 'OTPSCreen.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

TextEditingController PhoneController = TextEditingController();

class _PhoneAuthState extends State<PhoneAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff003366),
        title: const Text(
          "Continue with Phone",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,letterSpacing: 1),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (builder) => const SignInPage()),
                    (route) => false);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                cursorColor: const Color(0xff003366),
                cursorWidth: 2.5,
                controller: PhoneController,
                decoration: InputDecoration(
                    hintText: "+917434872792",
                    hintStyle: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    prefixIcon: const Icon(Icons.phone)),
              )),
          const Padding(
            padding: EdgeInsets.only(top: 0),
            child: Text(
              "Kindly add your country code",
              style: TextStyle(fontFamily: "Poppins", fontSize: 13),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () async{
               await FirebaseAuth.instance.verifyPhoneNumber(
                          verificationCompleted: (PhoneAuthCredential credential) {
                            showSnackbar(context, "Verification Complete");
                          },
                          verificationFailed: (FirebaseAuthException ex) {
                            showSnackbar(context, ex.toString());
                          },
                          codeSent: (String verificationid, int? resendtoken) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OTPScreen(
                                          verificationid: verificationid,
                                      PhoneNumber: PhoneController.text,
                                        )));
                            showSnackbar(context, "OTP Sent");
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {
                          },
                          phoneNumber: PhoneController.text.toString());
              },
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.09,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: const Color(0xff003366),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                    child: Text(
                  "Send OTP",
                  style: TextStyle(
                      color: Colors.white, fontFamily: "Poppins", fontSize: 25,fontWeight: FontWeight.bold,letterSpacing: 2),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
  void showSnackbar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
