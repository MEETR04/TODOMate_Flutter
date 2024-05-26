import 'dart:math';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todomate/Pages/HomePage.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  String verificationid;
  String PhoneNumber;
  OTPScreen({super.key, required this.verificationid,required this.PhoneNumber});
  //OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: const Color(0xff003366),
        title: const Text("Verify OTP",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,letterSpacing: 2)),
        centerTitle: true,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
        Padding(
          padding: const EdgeInsets.only(top: 15,right: 150,left: 10),
          child: Text("We have sent an OTP to \n${widget.PhoneNumber}",style: const TextStyle(fontFamily: "Poppins",fontSize: 20),),
        ),
        SizedBox(
          height: 10,
        ),
        Center(child: otpfield()),


            Padding(
              padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
              child: InkWell(
                onTap: () async{
                  try{
                    PhoneAuthCredential credential =
                        await PhoneAuthProvider.credential(
                            verificationId: widget.verificationid,
                            smsCode: otpcontroller.text.toString());
                    FirebaseAuth.instance.signInWithCredential(credential);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                    showSnackbar(context, "Logged In");
                  } catch (e) {
                    print(e.toString());
                    showSnackbar(context, e.toString());
                  }
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
                        "Verify",
                        style: TextStyle(
                            color: Colors.white, fontFamily: "Poppins", fontSize: 25,fontWeight: FontWeight.bold,letterSpacing: 2),
                      )),
                ),
              ),
            ),
      ]),
    );
  }

  Widget otpfield() {
    return Pinput(
      controller: otpcontroller,
      length: 6,
      defaultPinTheme: PinTheme(
          width: 50,
          height: 50,
          textStyle: TextStyle(fontFamily: "Poppins", fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
  void showSnackbar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
